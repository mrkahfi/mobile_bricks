# {{ appName }}

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)

## Features
*  Fake login authentication

## Specification
*  Adapted from Clean Architecture with Riverpod state Management
*  ThemeMode toggle (Dark and Light) 🔥
*  Powered by ZOG UI with examples (`ZeroApp`)
*  Contants Generation to get rid of hadcoded texts
*  Localizations using `easy_localization`
*  Multiple flavors with multiple Firebase environments
*  Skeleton (shimmer) loading effect
*  Quick files generation with Mason CLI
*  Implementation example of cstom colors and typography
*  Custom Linting


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
* [Riverpod Pattern](https://riverpod.dev/) - A Reactive Caching and Data-binding Framework
* [Go Router](https://pub.dev/packages/go_router/) - Declarative router for Flutter based on Navigation 2 
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator.
* [Dio](https://github.com/cfug/dio) - A type-safe HTTP client.
* [Json Serializable](https://pub.dev/packages/json_serializable) - Builders for handling JSON.
* [Freezed](https://pub.dev/packages/freezed) - Code generation for immutable classes
* [Formz](https://pub.dev/packages/formz) - Form representation and validation in a generic way.
* [Hive DB](https://docs.hivedb.dev/) - Lightweight and blazing key-value database written in Dart.
* [Easy Localization](https://pub.dev/packages/easy_localization) - To simplify the internationalization and localization.
* [ZOG UI](https://pub.dev/packages/zog_ui) - Collection of ZOG design system UI components
* [Mason CLI](https://pub.dev/packages/mason_cli) - To create and consume reusable templates called bricks

## TODOs 🗓️
* [x] Add Custom Linting
* [ ] Use Isar as Hive replacement
* [ ] Push Notification
* [x] Deep Link
* [ ] Modularization
* [ ] Responsive UI
* [ ] FVM 
* [ ] Integration Testing
* [ ] Unit Testing (Mocktail with Riverpod)

## Getting Started

### Configure Firebase Project 🔥

All the Firebase configuration for each platform has been done automatically upon project initialization using Mason.

However, in case you have to do them manually, execute these 3 commands right on the root directory of your **mobile** project.

```
# Configure Firebase project for development environment
flutterfire config  \
      --project={{ firebaseProjectId }}  \
      --ios-bundle-id={{ iosBundleId }}.dev \
      --android-package-name={{ androidAppId }}.dev \
      --ios-out=ios/config/dev/GoogleService-Info.plist \
      --out=lib/src/app/firebase/firebase_options_dev.dart
```
```
# Configure Firebase project for staging environment
flutterfire config  \
      --project={{ firebaseProjectId }} \
      --ios-bundle-id={{ iosBundleId }}.stg \
      --android-package-name={{ androidAppId }}.stg \
      --ios-out=ios/config/stg/GoogleService-Info.plist \
      --out=lib/src/app/firebase/firebase_options_stg.dart
```
```
# Configure Firebase project for production environment
flutterfire config \
      --project={{ firebaseProjectId }}  \
      --ios-bundle-id={{ iosBundleId }} \
      --ios-out=ios/config/prod/GoogleService-Info.plist \
      --android-package-name={{ androidAppId }} \
      --out=lib/src/app/firebase/firebase_options_stg.dart
```

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
2. Make sure the `appID` match your `{{ appleTeamId }}.{{ iosBundleId }}`.
3. Upload the file [apple-app-site-association](./ios/apple-app-site-association)  to your public directory of your website, under directory `[yourwebsite.com]/.wellknown/`, so it would be acccessible as `[yourwebsite.com]/.wellknown/apple-app-site-association`


## ABOUT ZOG UI

**IMPORTANT NOTE ON ZOG UI:** 

Zero One has just developed a package called [ZOG UI](https://pub.dev/packages/zog_ui). Its goal is to speed up the UI development process by providing a collection of ready-to-use components, yet still attempting to maintain their customizability.

However, **the package is currently still on alpha release and lacks documentation**. Therefore, consider using ZOG UI components pragmatically. If you encounter issues in some components, **DO** implement your own components instead of relying on all of ZOG UI components by trying to customize them.


## Localization Setup

- Open folder [`assets/translations/`](./assets/translations/)
- Add some text for `en` and `id` version language.
- Run code in terminal for generate `easy_localization` :

```
flutter pub run easy_localization:generate -h
```
- Then run this code for generate `codegen_loader.g.dart` :

```
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/localization"
```

- Finally run this code for generate `locale_keys.g.dart`:
```
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/localization" -o "locale_keys.g.dart" -f keys
```


## Run the App using command prompt ▶️

For development:

```console
flutter run --flavor dev --dart-define=API_URL='<your_dev_api_url>'
```

For staging:

```console
flutter run --flavor stg --dart-define=API_URL='<your_staging_api_url>'
```

For production

```console
flutter run --flavor prod --dart-define=API_URL='<your_prod_api_url>'
```



## How to run the Test


## Author 🧑‍💻

* **{{ teamName }}**

Don't forget to follow us, fork and give us a ⭐


## License

```