extension XString on String {
  /// [INFO]
  /// Use this extension to tagging the hardcoded text
  String get hardcoded => this;

  /// [INFO]
  /// Use this extension to get [DateTime] from a string
  DateTime? get toDateTime {
    return DateTime.tryParse(this);
  }

  /// [INFO]
  /// Use this extension to trim a string from List<String>
  /// Example :
  /// ["A", "B", "C"] -> toString() -> "[ABC]"
  /// ["A", "B", "C"] -> toString() -> "[ABC]" -> trimList -> "ABC"
  String get trimList {
    return replaceAll('[', '').replaceAll(']', '');
  }

  double? get thousandToDouble {
    return double.tryParse(replaceAll(',', ''));
  }
}
