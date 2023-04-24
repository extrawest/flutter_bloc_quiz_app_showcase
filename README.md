# Simple Quiz App


[![Maintaner](https://img.shields.io/static/v1?label=Maksym%Ostrovyi&message=Maintainer&color=red)](mailto:maksym.ostrovyj@extrawest.com)
![GitHub release](https://img.shields.io/badge/release-v1.0.0-blue)

## PROJECT INFO

- **Bloc Quiz App based on Flutter v3.7.6**.
- **App works on Android and iOS**.

## Features

- One Answer Quiz
- True-False Quiz
- The results of quizzes are stored on the device
- Light/Dark theme switching (manual and auto)
- English and Ukrainian languages implemented (depends on system language)

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

In order to run in production mode provide an additional `--flavor=prod` argument to the run
command:

```shell
flutter run --flavor=prod
```

Important! To create the production build of the app you should also provider an
additional `--flavor=prod` argument:

```shell
flutter build ipa --flavor=prod
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


