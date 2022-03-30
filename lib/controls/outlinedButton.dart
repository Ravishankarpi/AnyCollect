import 'package:flutter/material.dart';

TextButton buildOutlinButton(
    Color overlayBorderColor, Color buttonTextColor, String buttonText, Function outlinedButtonClick) {
  return TextButton(
    style: ButtonStyle(
         backgroundColor : MaterialStateProperty.all<Color>(overlayBorderColor),
        //  backgroundColor : MaterialStateProperty.all<Color>(overlayBorderColor),
        // overlayColor: MaterialStateProperty.all<Color>(Colors.blue),
        // side: MaterialStateProperty.all(BorderSide(
        //     color: overlayBorderColor, width: 1.0, style: BorderStyle.solid))
            ),
    onPressed: () {
      outlinedButtonClick();
    },
    child: Text(
      buttonText,
      style: TextStyle(color: buttonTextColor),
    ),
  );
}
