#!/bin/bash

old_name=${1}
new_name=${2}

if [[ ! -n "$old_name" ]]; then
  echo "Variable 'old_name' is empty"
  exit 1
fi

if [[ ! -n "$new_name" ]]; then
  echo "Variable 'new_name' is empty"
  exit 1
fi

replace () {
  ack -l "${1}" | xargs perl -pi -E "s/${1}/${2}/g"
}

mv ${old_name}_app ${new_name}_app
mv ${old_name}_design ${new_name}_design

cd ${new_name}_app
flutter clean
rm -rf *.iml
cd ..

cd ${new_name}_design
flutter clean
rm -rf *.iml
mv lib/${old_name}_design.dart lib/${new_name}_design.dart
mv src/${old_name}_design.dart src/${new_name}_design.dart
mv src/${old_name}_design_exports.dart src/${new_name}_design_exports.dart
cd ..

replace ${old_name}_app ${new_name}_app
replace ${old_name}_design ${new_name}_design

echo "${new_name}_app" > .gitscope
echo "${new_name}_design" >> .gitscope

sed -i '' "s/custom_project_name=${old_name}/custom_project_name=${new_name}/g" update_project.sh

rm -rf .idea/

cd ${new_name}_app
flutter pub get
cd ..

cd ${new_name}_design
flutter pub get
cd ..
