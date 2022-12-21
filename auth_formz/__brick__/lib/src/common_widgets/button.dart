import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final bool enabled;
  final String text;
  final double fontSize;

  const CustomButton(
    this.text, {
    Key? key,
    this.height = 42,
    this.enabled = false,
    this.onPressed,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: height,
      decoration: BoxDecoration(
        color: enabled ? Colors.blue : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 40, height)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}

class MyBusButtonSecondary extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final double fontSize;

  const MyBusButtonSecondary(
    this.text, {
    Key? key,
    this.height = 42,
    this.onPressed,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color:
              onPressed != null ? Colors.white : Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: onPressed != null
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5))),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 40, height)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}
