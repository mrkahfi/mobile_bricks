# {{ appName }}

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)


## Features
*  Adapted from Clean Architecture with Riverpod state Management
*  ThemeMode toggle (Dark and Light) 🔥
*  Powered by ZOG UI with examples (`ZeroApp`)
*  Contants Generation to get rid of hadcoded texts
*  Localizations using `easy_localization`
*  Multiple flavors with multiple Firebase environments
*  Skeleton (shimmer) loading effect
*  Quick files generation with Mason CLI
*  Implementation example of cstom colors and typography


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
* [ ] Add Linting
* [ ] Use Isar for Hive replacement
* [ ] Push Notification
* [ ] Deep Link
* [ ] Modularization
* [ ] Responsive UI
* [ ] Integration Testing
* [ ] Unit Testing (Mocktail with Riverpod)


## Configure Firebase Project 🔥
Right on the root of the project, on terminal execute these 3 command

```
# Configure Firebase project for development environment
flutterfire config 
      --project={{ firebaseProjectId }} 
      --ios-bundle-{{ iosBundleId }}.dev
      --android-app-id={{ androidAppId }}.dev
      --out=lib/src/app/firebase/firebase_options_dev.dart
```
```
# Configure Firebase project for staging environment
flutterfire config 
      --project={{ firebaseProjectId }} 
      --ios-bundle-{{ iosBundleId }}.stg
      --android-app-id={{ androidAppId }}.stg
      --out=lib/src/app/firebase/firebase_options_stg.dart
```
```
# Configure Firebase project for production environment
flutterfire config 
      --project={{ firebaseProjectId }} 
      --ios-bundle-{{ iosBundleId }}
      --android-app-id={{ androidAppId }}
      --out=lib/src/app/firebase/firebase_options_stg.dart
```

## Localization Setup

- Open folder [`assets/translations/`]()
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


```console
flutter run --flavor dev --dart-define=API_URL='<your_api_url>'
```



## How to run the Test


## Author 🧑‍💻

* **{{ teamName }}**

Don't forget to follow us, fork and give us a ⭐


## License

```