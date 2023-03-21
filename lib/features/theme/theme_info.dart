import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redLight = Color(0xFFE44125);
const Color blackShade = Color(0xFF222222);
const Color cherryRed = Color(0xffe8001d);
const Color greyShadeLight = Color(0xFFE5E5E5);
const Color greyLight = Color(0x0c000000);
const Color white = Color(0xffffffff);
const Color blue = Color(0xff007FDC);
const Color darkBlue = Color(0xff123e6d);
const Color darkerBlue = Color(0xff092e54);
const Color textBlack = Color(0xff1C1C3B);
const Color simpleGray = Color(0xffB3B3C9);

class TextStyles {
  static const notifierTextLabel = TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}

final buttonText = TextStyle(
  fontSize: 14,
  color: blackShade,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.w600,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  primarySwatch: Colors.deepPurple,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade200,
    background: blackShade,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.black),
  dividerColor: Colors.black12,
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 14.0),
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Colors.black54,
    background: greyShadeLight,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 14.0),
  ),
);
