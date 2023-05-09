# {{ appName }}

[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)

## Development Guidelines
Before getting into development, please learn our [Development Handbook](doc/handbook.md) first!

  - [Architecture](doc/handbook.md#architecture)
  - [Project Structure](doc/handbook.md#project-structure)
  - [Naming](doc/handbook.md#naming)
    - [Models](doc/handbook.md#models)
    - [Widgets](doc/handbook.md#widgets)
    - [Presentation](doc/handbook.md#presentation)
    - [Classes and Variables](doc/handbook.md#classes-and-variables)
  - [Formatting](doc/handbook.md#formatting)
    - [Methods](doc/handbook.md#methods)
    - [Widgets](doc/handbook.md#widgets-1)
  - [**Commenting**](doc/handbook.md#commenting)
  - [Localization](doc/handbook.md#localization)
  - [Flavoring](doc/handbook.md#flavoring)
  - [Routing](doc/handbook.md#routing)
  - [Error Handling](doc/handbook.md#error-handling)
  - [Generated Sources](doc/handbook.md#generated-sources)
  - [MR and Code Review](doc/handbook.md#mr-and-code-review)
  - [Security](doc/handbook.md#security)
  - [Tech Stack(s)](doc/handbook.md#tech-stacks)
  - [**About ZOG UI**](doc/handbook.md#about-zog-ui)
  - [**Development Setup**](doc/handbook.md#development-setup)
    - [Manual Setup](doc/handbook.md#manual-setup)
    - [**Using Mason**](doc/handbook.md#using-mason)
  - [Version Manager](doc/handbook.md#version-manager)
    - [Setup](doc/handbook.md#setup)
    - [Usage](doc/handbook.md#usage)
  - [Notes](doc/handbook.md#notes)


## Folder Structure 🔥

    # Root Project
    .
    ├── android                       
    │   ├── app                      
    │   │   ├── src                            
    │   │   │   ├── google-services.json 
    ├── assets                            
    │   ├── fonts                        
    │   ├── images                           
    │   ├── translations 
    ├── ios                         
    │   ├── config                      
    │   │   ├── dev                            
    │   │   │   ├── GoogleServices-info.plist 
    │   │   ├── prod                             
    │   │   │   ├── GoogleServices-info.plist               
    │   │   ├── stg                             
    │   │   │   ├── GoogleServices-info.plist        
    ├── lib                             
    │   ├── gen                         # All generated codes go here
    │   └── src                         # All the source code here
    │   │   ├── app                                 
    │   │   │   ├── config              # Flavor and app config    
    │   │   │   ├── firebase            # Store Firebase options       
    │   │   │   ├── theme               # App theme, typography, colors, etc
    │   │   ├── common_widgets          # Widgets used in many places accross the app.
    │   │   ├── constants               # Constants, extras keys, etc,
    │   │   ├── features                         
    │   │   │   ├── auth  
    │   │   │   │   ├── application     # Feature service and domain mapper goes here
    │   │   │   │   ├── data            # DTO, request and response objects, and repositories
    │   │   │   │   ├── domain          # UI Entity objects
    │   │   │   │   ├── presentation    # UI and the controllers and states                    
    │   │   │   ├── main  
    │   │   │   │   ├── application  
    │   │   │   │   ├── data  
    │   │   │   │   ├── domain  
    │   │   │   │   ├── presentation                    
    │   │   ├── localization            # Generated CodeGen loader, LocaleKeys, etc  
    │   │   ├── routing                 # Routes using Go Router
    │   │   ├── services                # Local and remote data handling service
    │   │   ├── utils                   # Extensions, validators, etc.
    └── test                            


## Built With 🛠
* [Riverpod Pattern](https://riverpod.dev/) - State management
* [Go Router](https://pub.dev/packages/go_router/) - Navigation
* [Equatable](https://pub.dev/packages/equatable) - Dart objects comparison
* [Dio](https://github.com/cfug/dio) - HTTP client.
* [Json Serializable](https://pub.dev/packages/json_serializable) - JSON handling
* [Freezed](https://pub.dev/packages/freezed) - Code generation for immutable classes
* [Formz](https://pub.dev/packages/formz) - Form validation
* [Hive DB](https://docs.hivedb.dev/) - Local storage
* [Easy Localization](https://pub.dev/packages/easy_localization) - Localization
* [ZOG UI](https://pub.dev/packages/zog_ui) - UI components

## Getting Started

### Configure Firebase Project 🔥

Before you deploy the app to production, you need to have the Firebase project for it set up.

If the project was initially generated using `[app_scaffolding](/app_scaffolding/)`, then the Firebase configuration should have been done automatically. However, in case you have to redo it manually, please refer [Firebase Configuration](doc/tech_specs.md#firebase-project-setup)

## DeepLink Setup

### Android Setup

1. Retrieve your SHA-256 fingerprint

For debug APK, on Terminal:

```
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass androi
```

For release APK, firstly you need to have an [signing key](https://developer.android.com/studio/publish/app-signing#generate-key) first. You will get a keystore file.

Once done, on Terminal:

```
keytool -list -v -keystore <path_to_your_keystore_file>
```

2. Paste the given SHA-256 fingerprint to [assetlinks.json](./android/assetlinks.json) file
3. Upload the file [assetlinks.json](./android/assetlinks.json) to your public directory of your website, under directory `[yourwebsite.com]/.wellknown/`, so it would be acccessible as `[yourwebsite.com]/.wellknown/assetlinks.json`


### iOS Setup

1. Open [apple-app-site-association](./ios/apple-app-site-association) file
2. Make sure the `appID` match your `.{{ iosBundleId }}`.
3. Upload the file [apple-app-site-association](./ios/apple-app-site-association)  to your public directory of your website, under directory `[yourwebsite.com]/.wellknown/`, so it would be acccessible as `[yourwebsite.com]/.wellknown/apple-app-site-association`


## Localization Setup


1. Open `assets/translations`. There are 2 files which represents 2 languages, `en-US.json`, and `id-ID.json`
add a JSON field inside that JSON file.
2. Add some text for `en` and `id` version language.
3. Run the follwoing code in terminal for `easy_localization` generation :

```bash
flutter pub run easy_localization:generate -h
```

4. Then run the following command to generate `codegen_loader.g.dart` :

```bash
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/localization"
```

1. Run the following command generate `locale_keys.g.dart`:

```bash
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/localization" -o "locale_keys.g.dart" -f keys
```


## Run the App using command prompt ▶️

For development:

```console
flutter run --flavor dev --dart-define=API_URL='{{ devApiUrl }}'
```

For staging:

```console
flutter run --flavor stg --dart-define=API_URL='{{ stgApiUrl }}'
```

For production

```console
flutter run --flavor prod --dart-define=API_URL='{{ prodApiUrl }}'
```


## How to run the Test

```
TODO
```

## Documentation

- Technical Docs: Read [the whole technical specification document](doc/tech_specs.md). 
- Public API Docs: [](doc/api/index.html). 


## Author 🧑‍💻

@{{ teamName }}

* ****

Don't forget to follow us, fork and give us a ⭐


## License

```