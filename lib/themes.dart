import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currenTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFF250BC5),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        headline2: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        button: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
          primary: Color(0xFF250BC5),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(0xFF3918FF),
      backgroundColor: Colors.black38,
      scaffoldBackgroundColor: Color(0xFF1D1D1D),
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        headline2: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        button: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
          primary: Color(0xFF250BC5),
        ),
      ),
    );
  }
}
