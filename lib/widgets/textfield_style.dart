import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class InputStyleCustom {
  static InputDecoration textFieldStyle(context,
      {String labelTxt = "",
      Widget? suffixIcon,
      var errText,
      bool mandatory = true}) {
    return InputDecoration(
      label: RichText(
        text: TextSpan(
          text: labelTxt,
          style: TextStyle(color: ColorPalettes.arrowColor),
          children: [
            mandatory
                ? const TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.white),
                  )
                : const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
          ],
        ),
      ),
      labelStyle: const TextStyle(
        color: ColorPalettes.arrowColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      errorText: errText,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      counterText: "",
      border: InputBorder.none,
    );
  }
}
