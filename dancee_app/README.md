# Example vader application

## Develop and test with Flutter version
3.27.1

## Setup fvm and Flutter
  ```
  1) Run: dart pub global activate fvm
  2) Run: fvm install <flutter version>
  3) Run: fvm use <flutter version>
  ```

## Installation

  ```
  1) Clone this repository
  2) Setup fvm and Flutter
  3) Run: fvm flutter pub get
  4) Run: fvm dart run build_runner build --delete-conflicting-outputs
  5) Run: fvm flutter pub run slang 
  6) Edit lib/settings.dart for your local setup
  7) Run: fvm flutter run --dart-define="FLAVOR=production"
  ```

## Run builders
  ```
  1) Build runner: fvm dart run build_runner build --delete-conflicting-outputs
  2) Translations: fvm flutter pub run slang watch 
  3) Create icons: fvm flutter pub run flutter_launcher_icons
  4) Rename project: fvm dart run package_rename
  5) Make release: fvm flutter build apk --dart-define="FLAVOR=production"
  ```

## Run tests
  ```
  fvm flutter test
  ```

## Release new version
Version template: `<major>.<feature>.<patch>+<build>`

  ```
  1) Update app version and build number
  2) Make commit: git commit -m 'Bump to version 1.x.y+z'
  3) Create tag of new version: git tag v1.x.y+z master
  4) Push tag of new version to server: git push origin v1.x.y+z
  5) Make release: fvm flutter build apk --dart-define="FLAVOR=production"                
  ```

## Version change rules:
  ```
  Major number: change after some big refactor, app rewrite or make a lot of breaking changes (reset it to 1 after application rename)
  Feature number: increase after add or remove one or more features (reset it to zero after change major number)
  Patch number: change after fix some small bug or small changes (reset it to zero after change feature number)
  Build number: increase it before every build of app and push it to testers (reset it after change app stores)
  ```

## Contribution
  ```
  - Create issue with detail description if it doesn't exist.
  - In git create feature branch in format: <branch-name>_<issue-number>.
  - Into CHANGELOG.md add your feature description.
  - Develop widgets, components and pages in storybook_toolkit.
  - Use mocktail for mock your data in developed widgets.
  - From storybook_toolkit stories create golden tests.
  - After finish your new feature create MR into main branch.
  - After merge delete your feature branch.
  ```

## Git commits
Make commits by conventional commits rules: https://www.conventionalcommits.org/en/v1.0.0/ <br>
Issue number you can have in the scope of conventional commit.

### Commit examples:
```
Simple Update: `chore: fix typo in README`
Feature Addition: `feat(#1245): add user authentication module`
Bug Fix: `fix(#1249): resolve memory leak in data processing script `
Refactoring Code: `refactor(#1345): database connection logic`
Updating Documentation: `doc(#1225): update API documentation for new endpoints`
```

## Author

👤 **Martin Jablečník**

* Website: [martin-jablecnik.cz](https://www.martin-jablecnik.cz)
* Github: [@mjablecnik](https://github.com/mjablecnik)
* Blog: [dev.to/mjablecnik](https://dev.to/mjablecnik)


## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/mjablecnik">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>


/*
## 📝 License

Copyright © 2024 [Martin Jablečník](https://github.com/mjablecnik).<br />
This project is licensed under [MIT License](https://github.com/mjablecnik/vader_popup/blob/master/LICENSE).
*/
