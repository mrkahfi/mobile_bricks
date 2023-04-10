# mobile_bricks

## Getting Started

### 🔖 Pre-requisites

#### 1️⃣ Installed Firebase CLI

- Install [Firebase CLI](https://firebase.flutter.dev/docs/cli)

```
npm install -g firebase-tools
```

- Login to Firebase account that you will use to create a Firebase project.

```
firebase login
```

#### 2️⃣ A Firebase Project

Login to your Firebase console and [create a Firebase project](https://console.firebase.google.com/u/0/). Then, note the **project ID**.

### 🎯 Pub.dev
Install `mason_cli` from **[pub.dev](https://pub.dev/packages/mason_cli)**

```
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

### Initialize Mason

Go to the root of your mobile project and initialize Mason:

```
mason init
```

### 🧱 Update mason.yaml

There are two ways to consume the bricks, remotely and locally.

#### Remotely From the Repo

Open `mason.yaml` and add the following lines as a child of `brick`

```
# List all the bricks
bricks:
  app_scaffolding:
    git:
      url: https://github.com/zero-one-group/mobile_bricks.git
      path: app_scaffolding
```

#### Locally From the Cloned Repo

Getting the bricks from repositories can stuck for some reason, such as some security check issue. Alternatively, you can clone the repo and get it locally.

1. Clone the repo

```
git clone git@gitlab.zero-one-group.com:zo-group/software/mobile_bricks.git
```

2. Open `mason.yaml` and add the following lines as a child of `brick`

```
# List all the bricks
bricks:
  app_scaffolding:
    path: <path_to_your_cloned_repo>/app_scaffolding
```

Example:
```
# List all the bricks
bricks:
  app_scaffolding:
    path: ../../../mobile_bricks/app_scaffolding
```

### Get the bricks

```
mason get
```

## Use Cases 

### 🚀 Project Initialization
Instead of having a useless default "counter-app" project, use brick `app_scaffolding`. Just go to the root of your mobile project and run this command.

```
# initialize Mason 
mason make app_scaffolding
```

This initializes the whole starter app setup.

### Module Creation

```
TODO
```

### Feature Creation

```
TODO
```

## 📦 Contributing
Any contributions are welcomed. You can either file an issue, open a PR, or create a new impactful brick others can benefit from.
If you're making significant changes or refactor to the existing bricks, please elaborate your take on it.








