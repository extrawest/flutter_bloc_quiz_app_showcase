# Simple Quiz App


[![Maintanence](https://img.shields.io/badge/Maintenance-yes%3F-blue.svg)]()
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)]()
![GitHub release](https://img.shields.io/badge/release-v1.0.0-blue)
![Supported Programs](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web%20%20-blue.svg?logo=flutter)
[![View DEMO](https://img.shields.io/badge/VIEW-DEMO-lightgreen.svg)](https://glowing-pixie-a925de.netlify.app/)

## PROJECT INFO

- **Bloc Quiz App based on Flutter v3.7.6**.
- **App works on Android, iOS and WEB**.

## Features

- One Answer Quiz
- True-False Quiz
- The results of quizzes are stored on the device
- Light/Dark theme switching (manual and auto)
- English and Ukrainian languages implemented (depends on system language)

## Demo
https://glowing-pixie-a925de.netlify.app/
https://user-images.githubusercontent.com/64004849/234834046-db0f39f4-0b45-47d4-9603-527f4b26fc58.mp4


### Installing

On M1 Mac use `arch -x86_64 pod install` instead of just `pod install`.

### Configuration of the app
JSON config files with the API endpoints and credentials for dev and prod
environments: `configs_development.json` and `config_production.json` files

##### PRODUCTION

Create `config_production.json` inside the `assets` folder with the following structure:

```json
{
  "appName": "Bloc Quiz App",
  "apiDomain": "https://run.mocky.io/v3"
}
```

## RUN THE APP IN DEVELOPMENT OR PRODUCTION MODE

App supports 2 flavors: `dev` and `prod`.

To use flavor value in app, use next function

To use flavor value in app, use next function

```dart
Future<String?> getFlavor()
```

In order to run in production mode provide an additional flavor argument to the run
command:

- For Android/IOS:  `--flavor=prod`

```shell
flutter run --falvor=prod
```

- For Web: `--dart-define FLAVOR=prod`

```shell
flutter run --dart-define FLAVOR=prod
```


Important! To create the production build of the app you should also provider an
additional flavor argument:

- For Android/IOS:  `--flavor=prod`

```shell
flutter build ipa/apk --flavor=prod
```

- For Web: `--dart-define FLAVOR=prod`

```shell
flutter build web --dart-define FLAVOR=prod
```




##### DEVELOPMENT

**Follow the same process, but fill the empty fields with the development values**
The only difference is to create file named `config_development.json`

## Localization

1. Update en_EN.json, fr_FR.json and other json dictionaries in assets/ folder
2. Load assets:

```shell
flutter pub run easy_localization:generate --source-dir assets/i18n
```

3. Generate static keys for translations:

```shell
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir assets/i18n
```

## Generate model and other assets (freezed,mockito etc.)

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

## Testing

To run test run the following command in the terminal
```shell
flutter test test
```


