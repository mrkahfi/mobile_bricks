# mobile_bricks

Ready to use (and of course, to custom) code templates for ZOT Mobile team.

## Getting Started

### 🎯 Pub.dev
Install `mason_cli` from **[pub.dev](https://pub.dev/packages/mason_cli)**

```
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

### Initialize Mason

**Go to the root folder of your mobile project** and initialize Mason:

```
mason init
```

### 📥 Download the bricks.

There are two ways to download the bricks, remotely and locally.

#### ⛅️ Remotely From the Repo

Example: adding a brick to the list and installing.

```
mason add app_scaffolding --git-url https://gitlab.zero-one-group.com/zo-group/software/mobile_bricks.git --git-path app_scaffolding

```

#### 💾 Locally From the Cloned Repo

Getting the bricks from repositories can stuck for some reason, such as some security check issue. Alternatively, you can clone the repo and get it locally.

Example:

1. Clone the repo

```
git clone git@gitlab.zero-one-group.com:zo-group/software/mobile_bricks.git
```

2. Install the local brick.

```
mason add app_scaffolding --path <path_to_your_cloned_repo>/app_scaffolding
```

Example:
```
mason add app_scaffolding --path ../../../mobile_bricks/app_scaffolding
```

### 🧱 Get the bricks

```
mason get
```

## Use Cases 

### 🚀 Project Initialization
Instead of having a useless default "counter-app" project, use brick [`app_scaffolding`](/app_scaffolding). Just go to the root of your mobile project and run this command.

1. Add the brick.
```
mason add app_scaffolding --path <path_to_your_cloned_repo>/app_scaffolding
```

2. Make it.

```
mason make app_scaffolding
```

This initializes the whole starter app setup.

### Feature Invocation
Let's say you want to add a deep link functionality. We have [`feature_applink`](/features/applink).

1. Add the brick

```
```
mason add applink --path <path_to_your_cloned_repo>/features/applink
```
```

2. Make it
```
mason make feature_applink
```

Available features are place under [feature](/features/) folder.

### Feature Creation

```
TODO
```

## 📦 Contributing
Any contributions are welcomed. You can either file an issue, open a PR, or create a new impactful brick others can benefit from.
If you're making significant changes or refactor to the existing bricks, please elaborate your take on it.








