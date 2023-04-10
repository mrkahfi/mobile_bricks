# mobile_bricks

## Getting Started

### 🔖 Pre-requisites

#### Installed Firebase CLI

1. Install Firebase CLI

```
npm install -g firebase-tools
```

2. Login to Firebase account that you will use to create a Firebase project.

```
firebase login
```

#### A Firebase Project

Login to your Firebase console and [create a Firebase project](https://console.firebase.google.com/u/0/). Then, note the **project ID**.

### 🎯 Pub.dev
Install `mason_cli` from **[pub.dev](https://pub.dev/packages/mason_cli)**

```
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

### 🧱 Add all the available bricks

- Go to the root of your mobile project and initialize Mason:

```
mason init
```

- Open `mason.yaml` and add the following lines as a child of `brick`

```
# List all the bricks
bricks:
  app_scaffolding:
    git:
      url: https://github.com/zero-one-group/mobile_bricks.git
      path: app_scaffolding
```

NOTE: Currently we have only one brick called `app_scaffolding`. We're still working on other bricks.

- Get the bricks

```
mason get
```

## Use Cases 

### 🚀 Project Initialization
Instead of having a useless default "counter-app" project, use brick `app_scaffolding`. Just go to the root of your mobile project and run this command.

```
# 1️⃣ initialize Mason 
mason make app_scaffolding
```

This initializes the whole starter app setup.

### 2️⃣ Module Creation

```
TODO
```

### 3️⃣ Feature Creation

```
TODO
```

## 📦 Contributing
Any contributions are welcomed. You can either file an issue, open a PR, or create a new impactful brick others can benefit from.
If you're making significant changes or refactor to the existing bricks, please elaborate your take on it.








