#!/bin/bash

name=${1}

mv example_app ${name}_app
mv example_design ${name}_design

cd ${name}_app 
flutter clean
rm -rf *.iml
cd ..

cd ${name}_design 
flutter clean
rm -rf *.iml
mv lib/example_design.dart lib/${name}_design.dart
cd ..

replace example_app ${name}_app
replace example_design ${name}_design

echo '${name}_app' > .gitscope
echo '${name}_design' >> .gitscope

rm -rf .idea/
