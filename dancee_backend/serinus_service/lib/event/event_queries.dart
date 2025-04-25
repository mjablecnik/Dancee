class EventQuery {
  static const eventTypeRules = """
Z daného textu zjisti, o jaký typ taneční události se jedná.
Výsledek chci od tebe ve validním JSON formátu s následující přesnou strukturou:

{
  "type": "party | workshop | openLesson | lesson | course | festival | none"
}


Možné typy událostí: party, workshop, lesson, course, festival, none.
party: Taneční akce kam lidé přijdou a mohou si tam zatancovat. Před párty mohou být také taneční workshopy anebo lekce.
workshop: Akce, kam člověk může přijít a naučit se něco nového ohledně tancování. Například nové kroky, pokročilejší variace, muzikalitu anebo se naučit nový tanec.
lesson: Jednorázová taneční lekce která může být třeba na jednu hodinu a člověk se tam naučí něco nového podobně jako na workshopu.
course: Pravidelné opakování tanečních lekcí každý týden v určitý den a čas po určitou dobu (většinou na 2-3 měsíce).
festival: Velká několikadenní událost kam se sjede velké množství lidí na rúzné workshopy, lekce a taneční party.
none: Nejedná se o žádnou výše zmíněnou taneční událost kam člověk přijde a může tancovat anebo se něco nového naučit ohledně tancování.
""";

  static const eventInfoRules = """
Z následujícího textu získej informace o taneční akci a vygeneruj výstup ve formě JSONu s touto přesnou strukturou:

{
  "event_info": [
    {
      "type": "url | price",
      "key": "string",
      "value": "string",
    }
  ]
}

Do pole event_parts dej údaje jako jsou: 
- Odkaz na registraci
- Cena za vstup

Cokoliv jiného než je právě odkaz nebo cena tam nedávej.

**Důležité pravidla:**

1. Výstup musí být POUZE validní JSON dle výše uvedené struktury.
2. Pokud se některá hodnota nedá určit, ponech ji jako prázdný řetězec `""`, prázdné pole `[]`, nebo `null` – podle typu.
3. Texty ve výstupu musí být přeložené do češtiny, i pokud byl vstupní text v jiném jazyce.
4. Podle toho zda value je text, url nebo cena bude vypadat i value. 
5. Pokud je typ url, tak value musí být validní URL jinak value bude null.
6. Pokud je typ price, tak value musí být validní cena (nappříklad: 300 Kč) jinak value bude null.
7. Pokud nebude v textu vyloženě u odkazu uvedeno že toto je odkaz na registraci, tak value bude pro url null.
""";

  static const eventPartsRules = """
Z následujícího textu získej informace o taneční akci a vygeneruj výstup ve formě JSONu s touto přesnou strukturou:

{
  "description": "string (popis akce v češtině)",
  "event_parts": [
    {
      "name": "string (např. 'Workshop pro začátečníky', 'Hlavní párty' – v češtině)",
      "description": "string (popisující danou část, v češtině)",
      "type": "party | workshop | openLesson",
      "dances": ["string (např. 'Salsa', 'Bachata'), musí začínat vždy velkým písmenem"],
      "date_time_range": {
        "start": "string (ISO 8601 UTC)",
        "end": "string (ISO 8601 UTC)"
      },
      "lectors": ["string (nepovinné, jména lektorů pokud existují)"],
      "djs": ["string (nepovinné, jména DJů pokud existují)"]
    }
  ]
}


Do pole description vygeneruj popis události, který bude jasně  říkat na co se lidé mohou těšit a jednoduče je navnadí aby byly motivováni přijít
Text v description musí být maximálně 1024 znaků. 
Text musí dobře čitelný a strukturovaný. Pro nové řádky používej: "\n".

Pokud je celá akce rozdělená do vícero bloků, jako je třeba open lekce, potom párty a pak půlnoční překvapení nebo odpolední workshopy a večerní party anebo festival rozdělený na několik dnů. 
Tak jednotlivé bloky uveď v event_parts kde name je jméno bloku, `description` je popis co se v daném bloku bude dít a na co se lidé mohou těšit, 
`type` je o co konkrétně se jedná (party, workshop, open lesson), `dances` je s jakými tanci se v daném bloku člověk setká, `date_time_range` je od kdy do kdy trvá daný blok.
`lectors` jsou lektoři v daném bloku a `djs` jsou DJové kteří zrovna hrají na party.



**Důležité pravidla:**

1. Výstup musí být POUZE validní JSON dle výše uvedené struktury.
2. Pokud se některá hodnota nedá určit, ponech ji jako prázdný řetězec `""`, prázdné pole `[]`, nebo `null` – podle typu.
3. Texty ve výstupu musí být přeložené do češtiny, i pokud byl vstupní text v jiném jazyce.
4. Všechna data a časy uváděj ve formátu ISO 8601 v UTC (např. `2025-04-25T18:00:00Z`).
5. Prostor kde se tančí překládej jako: `místnost` nebo `sál`.
6. Pokud jsou v předkládaném textu nějaké emotikony, tak můžeš v description použít emotikony stejného typu a významu.
""";
}
