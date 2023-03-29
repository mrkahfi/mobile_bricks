# mobile_bricks

## Getting Started

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
  zot_starter_mobile:
      git:
        url: https://github.com/zero-one-group/mobile_bricks.git
        path: zot_starter_mobile
```

NOTE: Currently we have only one brick called `zot_starter_mobile`. We're still working on other bricks.

## Usage Case 

### Project Initialization
Instead of having a useless default "counter-app" project, use brick `zot_starter_mobile`. Just go to the root of your mobile project and run this command.

```
# initialize Mason 
mason make zot_starter_mobile
```


### Add A New Module

```
TODO
```








