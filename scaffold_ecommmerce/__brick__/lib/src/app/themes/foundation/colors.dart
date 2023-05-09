import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// Constant for LIGHT colors to be used in the app according to the DS
class LightColors {
  static const primaryColor = ShadedColor(0xFF85E51A, {
    1: Color(0xFFF4FDEA),
    2: Color(0xFFDEF8C1),
    3: Color(0xFFC7F397),
    4: Color(0xFFBBF080),
    5: Color(0xFFABED62),
    6: Color(0xFF85E51A),
    7: Color(0xFF77CE18),
    8: Color(0xFF5DA012),
    9: Color(0xFF42720D),
    10: Color(0xFF284508),
  });

  static const neutralColor = ShadedColor(0xFFB8B8B8, {
    1: Color(0xFFFFFFFF),
    2: Color(0xFFF1F1F1),
    3: Color(0xFFDADADA),
    4: Color(0xFFB8B8B8),
    5: Color(0xFF999999),
    6: Color(0xFF808080),
    7: Color(0xFF616161),
    8: Color(0xFF4E4E4E),
    9: Color(0xFF292929),
    10: Color(0xFF0E0E0E),
  });

  static const secondaryColor = ShadedColor(0xFF00A5FF, {
    1: Color(0xFFE8F7FF),
    2: Color(0xFFB9E7FF),
    3: Color(0xFF8BD6FF),
    4: Color(0xFF57C4FF),
    5: Color(0xFF39B9FF),
    6: Color(0xFF00A5FF),
    7: Color(0xFF0087D1),
    8: Color(0xFF0069A2),
    9: Color(0xFF004B74),
    10: Color(0xFF002D46),
  });

  static const successColor = ShadedColor(0xFF389e0d, {
    1: Color(0xFFf6ffed),
    2: Color(0xFFd9f7be),
    3: Color(0xFFb7eb8f),
    4: Color(0xFF95de64),
    5: Color(0xFF73d13d),
    6: Color(0xFF52c41a),
    7: Color(0xFF389e0d),
    8: Color(0xFF237804),
    9: Color(0xFF135200),
    10: Color(0xFF092b00),
  });

  static const errorColor = ShadedColor(0xFFFB0404, {
    1: Color(0xFFFFE8E8),
    2: Color(0xFFFEBBBB),
    3: Color(0xFFFD8D8D),
    4: Color(0xFFFC6060),
    5: Color(0xFFFC5555),
    6: Color(0xFFFB0404),
    7: Color(0xFFCD0404),
    8: Color(0xFF9F0303),
    9: Color(0xFF720202),
    10: Color(0xFF440101),
  });

  static const warningColor = ShadedColor(0xFFFFC700, {
    1: Color(0xFFFFFAE8),
    2: Color(0xFFFFF0B9),
    3: Color(0xFFFFE68B),
    4: Color(0xFFFFDB5D),
    5: Color(0xFFFFCF24),
    6: Color(0xFFFFC700),
    7: Color(0xFFD1A300),
    8: Color(0xFFA27F00),
    9: Color(0xFF745A00),
    10: Color(0xFF524311),
  });
}

/// Constant for DARK colors to be used in the app according to the DS
class DarkColors {
  static const primaryColor = ShadedColor(0xFFABED62, {
    1: Color(0xFF284508),
    2: Color(0xFF42720D),
    3: Color(0xFF5DA012),
    4: Color(0xFF77CE18),
    5: Color(0xFF85E51A),
    6: Color(0xFFABED62),
    7: Color(0xFFBBF080),
    8: Color(0xFFC7F397),
    9: Color(0xFFDEF8C1),
    10: Color(0xFFF4FDEA),
  });

  static const neutralColor = ShadedColor(0xFF999999, {
    1: Color(0xFF0E0E0E),
    2: Color(0xFF292929),
    3: Color(0xFF4E4E4E),
    4: Color(0xFF616161),
    5: Color(0xFF808080),
    6: Color(0xFF999999),
    7: Color(0xFFB8B8B8),
    8: Color(0xFFDADADA),
    9: Color(0xFFF1F1F1),
    10: Color(0xFFFFFFFF),
  });

  static const secondaryColor = ShadedColor(0xFF00A5FF, {
    10: Color(0xFF002D46),
    9: Color(0xFF004B74),
    8: Color(0xFF0069A2),
    7: Color(0xFF0087D1),
    6: Color(0xFF00A5FF),
    5: Color(0xFF39B9FF),
    4: Color(0xFF57C4FF),
    3: Color(0xFF8BD6FF),
    2: Color(0xFFB9E7FF),
    1: Color(0xFFE8F7FF),
  });

  static const successColor = ShadedColor(0xFF52c41a, {
    10: Color(0xFF092b00),
    9: Color(0xFF135200),
    8: Color(0xFF237804),
    7: Color(0xFF389e0d),
    6: Color(0xFF52c41a),
    5: Color(0xFF73d13d),
    4: Color(0xFF95de64),
    3: Color(0xFFb7eb8f),
    2: Color(0xFFd9f7be),
    1: Color(0xFFf6ffed),
  });

  static const errorColor = ShadedColor(0xFFFC5555, {
    1: Color(0xFF440101),
    2: Color(0xFF720202),
    3: Color(0xFF9F0303),
    4: Color(0xFFCD0404),
    5: Color(0xFFFB0404),
    6: Color(0xFFFC5555),
    7: Color(0xFFFC6060),
    8: Color(0xFFFD8D8D),
    9: Color(0xFFFEBBBB),
    10: Color(0xFFFFE8E8),
  });

  static const warningColor = ShadedColor(0xFFFFC700, {
    10: Color(0xFF524311),
    9: Color(0xFF745A00),
    8: Color(0xFFA27F00),
    7: Color(0xFFD1A300),
    6: Color(0xFFFFC700),
    5: Color(0xFFFFCF24),
    4: Color(0xFFFFDB5D),
    3: Color(0xFFFFE68B),
    2: Color(0xFFFFF0B9),
    1: Color(0xFFFFFAE8),
  });
}
