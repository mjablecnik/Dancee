#!/bin/bash

template_project_name=example
custom_project_name=dancee

address=https://raw.githubusercontent.com/mjablecnik/vader_framework/refs/heads/master

if ! type github-dlr >/dev/null 2>&1; then
  echo "Command 'github-dlr' is not installed."
  echo "Please, installed this command by run:"
  echo "  pipx install github-dlr"
  echo "or"
  echo "  pip install github-dlr"
  exit 1
fi

curl $address/${template_project_name}_project/rename_project.sh > rename_project.sh
#curl $address/${template_project_name}_project/update_project.sh > update_project.sh


cd ${custom_project_name}_design

rm -rf bricks
rm -rf mason.yaml
rm -rf mason-lock.json

github-dlr https://github.com/mjablecnik/vader_framework/tree/master/${template_project_name}_project/${template_project_name}_design/bricks
curl $address/${template_project_name}_project/${template_project_name}_design/mason.yaml > mason.yaml
curl $address/${template_project_name}_project/${template_project_name}_design/mason-lock.json > mason-lock.json

curl $address/${template_project_name}_project/${template_project_name}_design/commands.yaml > commands.yaml
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/${template_project_name}_project/${template_project_name}_design/vader
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/${template_project_name}_project/${template_project_name}_design/bin


cd ../${custom_project_name}_app

curl $address/${template_project_name}_project/${template_project_name}_app/commands.yaml > commands.yaml
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/${template_project_name}_project/${template_project_name}_app/vader
# github-dlr https://github.com/mjablecnik/vader_framework/tree/master/${template_project_name}_project/${template_project_name}_app/bin

cd ..

replace ${template_project_name}_app ${custom_project_name}_app
replace ${template_project_name}_design ${custom_project_name}_design
# ./rename_project.sh ${template_project_name} ${custom_project_name}
