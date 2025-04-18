import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class BadgeIconButton extends StatelessWidget {
  final String icon;
  final int badgeCount;

  const BadgeIconButton({super.key, required this.icon, this.badgeCount = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Image.asset(
            icon,
            width: 30,
            height: 30,
          ),
          onPressed: () {
            // Handle button press
          },
        ),
        if (badgeCount > 0)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ColorPalettes.darkOrangeColor,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
