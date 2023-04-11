import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:{{ packageName }}/src/localization/locale_keys.g.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
    this.text, {
    required this.onPressed,
    super.key,
    this.height = 42,
    this.isLoading = false,
    this.fontSize = 16,
    this.isDisabled = false,
  });
  final double height;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: height,
      child: ZeroButton.primary(
        style: ZeroButtonStyle(
          fixedSize: Size(MediaQuery.of(context).size.width - 40, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        isDisabled: isDisabled || isLoading,
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: ZeroProgressIndicator.circular(),
              )
            : const Text(
                LocaleKeys.login,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
      ),
    );
  }
}
