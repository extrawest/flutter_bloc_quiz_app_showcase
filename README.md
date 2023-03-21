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



