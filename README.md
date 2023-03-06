# Flutter BLoC Project Starter

<a href="mailto:andriy.gulak@extrawest.com" alt="Contributors">
  <img src="https://img.shields.io/static/v1?label=Andriy Gulak&message=Maintainer&color=red" />
</a>
<a href="mailto:maksym.ostrovyj@extrawest.com" alt="Contributors">
  <img src="https://img.shields.io/static/v1?label=Maksym%20Ostrovyi&message=Contributor&color=red" />
</a>

A new Flutter application starter bundled with BLoC library for state management.

## 1. Setup Tutorial

In order to use this starter in your project, do the following step-by-step:

**1. Clone this repo to your folder:**

`git clone https://gitlab.extrawest.com/andriy.gulak/flutter_bloc_project_starter.git`

**2. Change directory to the previously cloned folder**

`cd flutter_bloc_project_starter/ `

**3. Remove existing .git folder**

`rm -rf .git `

**4. [Change the app name, package name and bundleId (Android & iOS)](https://gitlab.extrawest.com/internal/knowledge-base/-/blob/master/mobile-dev/flutter/tips_and_tricks.md)** -- Follow **Change the app name, package name and bundleId (Flutter, Android & iOS)** section

**4.1  Remove this 'Setup Tutorial' section from the README.md file. Leave only what's related to 'Instructions on how to build, run and config' section below**

**5. Initialize empty folder with git**

`git init`

**6. Set remote url to your empty repository**

`git remote add origin https://gitlab.extrawest.com/user.name/your_empty_repository.git`

**7. Add all files to git**

`git add .`

**8. Commit all the files with 'initial commit' commit message**

`git commit -m "initial commit"`

**9. Push to remote repository**

`git push -u origin main`

## Instructions on how to build, run and config
## Localization

### 1. Update en.json and other json dictionaries under the assets/i18n folder

### 2. Load assets:

```shell
flutter pub run easy_localization:generate --source-dir assets/i18n
```

### 3. Generate static keys for translations

```shell
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir assets/i18n
```

### 4. Generate boilerplate (Freezed, Mockito etc.)

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```


## CREATE CREDENTIALS FILES FOR DEVELOPMENT AND PRODUCTION MODE

Create `credentials_production.json` and `credentials_development.json` inside the `assets` folder.
Do not add these files to GIT!
Files should have the following structure:

```json
{
  "appName": "",
  "apiDomain": ""
}
```
Where:
- `flavorName` could be 'prod' or 'dev' (depends on the environment)
- Value for `appName` should be according to your project
- Value for `apiDomain`, can be obtained on the backend

## RUN THE APP IN DEVELOPMENT OR PRODUCTION MODE

App supports 2 flavors: `dev` and `prod`.

To use flavor value in app, use next function

```dart
Future<String?> getFalvor()
```

In order to run in production mode provide an additional `--flavor=prod` argument to the run
command:

```shell
flutter run --falvor=prod
```

Important! To create the production build of the app you should also provider an
additional `--flavor=prod` argument:

```shell
flutter build ipa --flavor=prod
```

## Implemented Features

- MVVM (BLoC Feature Based) state sharing and state managing solution
- Fully featured localization / internationalization (i18n):
    - Pluralization support
    - Supports both languageCode (en) and languageCode_countryCode (en_US) locale formats
    - Automatically save & restore the selected locale
    - Full support for right-to-left locales
    - Fallback locale support in case the system locale is unsupported
    - Supports both inline or nested JSON
- NOSQL database integration (HIVE)
- Light/Dark theme configuration
- Dynamic Themes changing
- API client configuration
- DEV/PROD flavors configuration (native flavors included)
- Multilevel configurable logger
- Static analysis tool integration (flutter_lints package + custom rules config)
- Common widgets sharing and reusing example
- Resolution-aware images (1x,2x,3x sizes)

### Contributing

1. Fork it!
1. Create your feature branch: `git checkout -b new-cool-tip`
1. Commit your changes: `git commit -am 'Added new tip'`
1. Push to the branch: `git push origin new-cool-tip`
1. Submit a pull request.

---
Created by Extrawest Mobile Team
[Extrawest.com](https://www.extrawest.com), 2022
---
