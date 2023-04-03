enum Flavor {
  prod,
  stg,
  dev,
  ;

  @override
  String toString() {
    switch (this) {
      case dev:
        return 'DEV';
      case stg:
        return 'STG';
      case prod:
        return 'PROD';
      default:
        return 'DEV';
    }
  }
}

/// Configure the flavor based on environment 'ENV' param passed when running main
class F {
  static late Flavor flavor;

  static void configureFromEnv(String env) {
    switch (env) {
      case 'DEV':
        flavor = Flavor.dev;
        break;
      case 'STG':
        flavor = Flavor.stg;
        break;
      case 'PROD':
        flavor = Flavor.prod;
        break;
      default:
        flavor = Flavor.dev;
    }
  }
}

/// Config multiple flavors
class FlavorConfig<T> {
  const FlavorConfig({
    required this.dev,
    required this.stag,
    required this.prod,
    this.fallback,
  }) : assert(
          dev == null || prod == null ? fallback != null : true,
          '[fallback]cannot be null if there is one flavor whose value is null',
        );

  final T? dev;
  final T? stag;
  final T? prod;
  final T? fallback;

  T get value {
    switch (F.flavor) {
      case Flavor.dev:
        return dev ?? fallback!;
      case Flavor.stg:
        return stag ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
