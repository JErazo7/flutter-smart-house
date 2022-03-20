import 'package:flutter/material.dart';

class SmartHouseButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool? enabled;
  final String text;

  const SmartHouseButton({
    Key? key,
    this.width,
    this.height,
    this.enabled,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        fixedSize:
            Size(width ?? MediaQuery.of(context).size.width, height ?? 64),
        textStyle: Theme.of(context).textTheme.headline6,
      ),
      onPressed: enabled != null && !enabled! ? null : onPressed,
      child: Text(
        text,
      ),
    );
  }
}
