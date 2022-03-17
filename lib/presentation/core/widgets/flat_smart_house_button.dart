import 'package:flutter/material.dart';

class FlatSmartHouseButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String text;

  const FlatSmartHouseButton({
    Key? key,
    this.width,
    this.height,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black87,
      fixedSize: Size(width ?? MediaQuery.of(context).size.width, height ?? 64),
      textStyle: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.normal),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
