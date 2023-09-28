import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppColors {
  final bool isDarkTheme;

  AppColors({this.isDarkTheme = false});

  Color get bgColor => isDarkTheme ? Color(0xff111111) : Color(0xffF1F1F1);
  Color get bgContainer => isDarkTheme
      ? Color.fromARGB(255, 71, 60, 47).withOpacity(0.3)
      : const Color(0xFFFCD8AC).withOpacity(0.3);
  Color get bgContainer1 =>
      isDarkTheme ? Color.fromARGB(255, 63, 62, 62) : const Color(0xFFC0C0C0);
  Color get bgContainer2 =>
      isDarkTheme ? Color.fromARGB(255, 51, 166, 219) : const Color(0xFFAACEDF);
  Color get bgContainer3 =>
      isDarkTheme ? Color.fromARGB(255, 30, 70, 127) : const Color(0xFFDAE2ED);
  Color get bitcoinColor => const Color(0xFFF7931A);
  Color get blackColor => isDarkTheme ? Color(0xffF1F1F1) : Color(0xff111111);
  Color get boldText => isDarkTheme
      ? Color.fromARGB(255, 255, 255, 255)
      : const Color(0xFF6E6E6E);
  Color get borderColor =>
      isDarkTheme ? Color.fromARGB(255, 56, 56, 56) : const Color(0xFFD1D1D1);
  Color get buttonColor => isDarkTheme
      ? Color.fromARGB(255, 188, 188, 188)
      : const Color(0xFF949494);
  Color get coinBoxColor =>
      isDarkTheme ? Color.fromARGB(255, 46, 46, 46) : const Color(0xffF2F2F2);
  Color get darkBlue => isDarkTheme
      ? Color.fromARGB(255, 136, 141, 232)
      : const Color(0xFF4F56F0);
  Color get dividerColor => isDarkTheme
      ? Color.fromARGB(255, 255, 254, 254)
      : const Color(0xFFD4D4D4);
  Color get fill => const Color(0xFF919191);
  Color get headings => isDarkTheme ? Color(0xffF1F1F1) : Color(0xff111111);
  Color get imageBgColor =>
      isDarkTheme ? Color.fromARGB(255, 17, 17, 17) : const Color(0xffE3E3E3);
  Color get selectedBox =>
      isDarkTheme ? const Color(0xFF6372CB) : const Color(0xFF6372CB);
  Color get textColor => const Color(0xFF5A5A5A);
  Color get theme => const Color(0xFF4941F2);
  Color get tilesColor => isDarkTheme
      ? Color.fromARGB(255, 55, 55, 55)
      : Color.fromARGB(255, 201, 200, 200);
  Color get transparent => Colors.transparent;
  Color get unSelectedIcon => const Color(0xFF989898);
  Color get whiteColor => isDarkTheme ? Color(0xffF1F1F1) : Color(0xff111111);
}
