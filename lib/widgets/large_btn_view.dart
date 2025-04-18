import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class LargeBtnView extends StatelessWidget {
  final Function() onTap;
  final bool isDisable;
  final String btnName;

  const LargeBtnView({
    super.key,
    required this.onTap,
    this.isDisable = false,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: isDisable
            ? ColorPalettes.arrowColor
            : ColorPalettes.darkOrangeColor,
        child: InkWell(
          onTap: isDisable ? null : onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    btnName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isDisable ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
             ),
          ),
        ),
      ),
    );
  }
}
