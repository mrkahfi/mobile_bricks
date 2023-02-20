enum Flavor {
  prod,
  stag,
  dev,
}

class F {
  static late Flavor flavor;
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
      case Flavor.stag:
        return stag ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
