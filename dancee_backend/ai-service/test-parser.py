#  import langchain
#  from langchain.chat_models import ChatOpenAI
#  from langchain.prompts import PromptTemplate
#  from langchain.output_parsers.structured import StructuredOutputParser, ResponseSchema
#  
#  # 🔹 1. Definuj schéma JSON výstupu
#  schemas = [
#      ResponseSchema(name="jmeno", description="Celé jméno osoby"),
#      ResponseSchema(name="datum_narozeni", description="Datum narození ve formátu YYYY-MM-DD"),
#      ResponseSchema(name="misto_bydliste", description="Město, kde osoba žije"),
#      ResponseSchema(name="povolani", description="Pracovní pozice osoby")
#  ]
#  
#  output_parser = StructuredOutputParser.from_response_schemas(schemas)
#  format_instructions = output_parser.get_format_instructions()
#  
#  # 🔹 2. Vytvoř LLM prompt
#  prompt = PromptTemplate(
#      template="Extrahuj následující informace z textu a ulož je do JSON:\n{format_instructions}\n\nText:\n{text}",
#      input_variables=["text"],
#      partial_variables={"format_instructions": format_instructions}
#  )
#  
#  # 🔹 3. Použij OpenAI GPT
#  llm = ChatOpenAI(model="gpt-4", temperature=0, api_key="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")
#  
#  # 🔹 4. Použij LangChain k zpracování textu
#  text = "Pan Jan Novák, narozen 15. 3. 1980, bydlí v Brně a pracuje jako programátor."
#  chain = prompt | llm | output_parser
#  
#  # Výsledek
#  structured_data = chain.invoke({"text": text})
#  print(structured_data)
#  


import json
import re
from typing import List

from langchain_core.messages import AIMessage
from langchain_core.prompts import ChatPromptTemplate
from pydantic import BaseModel, Field

from langchain.chat_models import init_chat_model

llm = init_chat_model("gpt-4", model_provider="openai")

# llm = ChatOpenAI(model="gpt-4", temperature=0, api_key="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")

class Person(BaseModel):
    """Information about a person."""

    name: str = Field(..., description="The name of the person")
    height_in_meters: float = Field(
        ..., description="The height of the person expressed in meters."
    )


class People(BaseModel):
    """Identifying information about all people in a text."""

    people: List[Person]


# Prompt
prompt = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "Answer the user query. Output your answer as JSON that  "
            "matches the given schema: ```json\n{schema}\n```. "
            "Make sure to wrap the answer in ```json and ``` tags",
        ),
        ("human", "{query}"),
    ]
).partial(schema=People.model_json_schema())


# Custom parser
def extract_json(message: AIMessage) -> List[dict]:
    """Extracts JSON content from a string where JSON is embedded between ```json and ``` tags.

    Parameters:
        text (str): The text containing the JSON content.

    Returns:
        list: A list of extracted JSON strings.
    """
    text = message.content
    # Define the regular expression pattern to match JSON blocks
    pattern = r"```json(.*?)```"

    # Find all non-overlapping matches of the pattern in the string
    matches = re.findall(pattern, text, re.DOTALL)

    # Return the list of matched JSON strings, stripping any leading or trailing whitespace
    try:
        return [json.loads(match.strip()) for match in matches]
    except Exception:
        raise ValueError(f"Failed to parse: {message}")




query = "Anna Kopecká is 23 years old and she is 6 feet tall"

#print(prompt.format_prompt(query=query).to_string())

chain = prompt | llm | extract_json

structured_data =chain.invoke({"query": query})

print(structured_data)


