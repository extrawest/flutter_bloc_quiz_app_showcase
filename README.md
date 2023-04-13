# Simple Quiz App (BloC)

## PROJECT INFO

- **Bloc Quiz App works with Flutter v3.7.6**.

### Installing

On M1 Mac use `arch -x86_64 pod install` instead of just `pod install`.

### Configuration of the app
JSON config files with the API endpoints and credentials for dev and prod
environments: `configs_development.json` and `config_production.json` files

##### PRODUCTION

Create `config_production.json` inside the `assets` folder with the following structure:

```json
{
  "appName": "",
  "baseApiUrl": ""
}
```

- Value for `appName` should be 'APP_NAME' respectively
- Value for `apiDomain` can be obtained on the backend


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

