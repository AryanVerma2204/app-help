import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const TextFieldContainer(
      {super.key, required this.child, this.color = ColorPalettes.arrowColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: color)),
        child: child,
      ),
    );
  }
}
