import 'package:flutter/material.dart';

abstract class AppColors {

  static Color red = const Color.fromARGB(255, 218, 31, 38);

  static Color redLight = const Color.fromARGB(255, 239, 190, 189);

  static Color grey = Colors.grey[600]!;

  static Color white = Colors.white;
}

abstract class AppButtons {
  static ButtonStyle myButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    
  );
}

abstract class AppFont {
  static TextStyle textFieldStyle = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.red,
  );
  static TextStyle cairoS = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
    fontSize: 17,
    color: AppColors.red,
  );
}
