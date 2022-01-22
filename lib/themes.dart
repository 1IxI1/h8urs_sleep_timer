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
      unselectedWidgetColor: Colors.black26,
      canvasColor: Color(0xFFFFC93E),
      errorColor: Color(0xFFC50B0B),
      focusColor: Colors.black,
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
        headline3: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 53,
            color: Colors.black,
          ),
        ),
        headline4: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        bodyText1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        bodyText2: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        subtitle1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        button: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
      backgroundColor: Color(0xFF1D1D1D),
      scaffoldBackgroundColor: Color(0xFF1D1D1D),
      unselectedWidgetColor: Color(0xFFBFBFBF).withOpacity(0.33),
      canvasColor: Color(0xFFFFC93E),
      errorColor: Color(0xFFC50B0B),
      focusColor: Colors.white,
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        headline2: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        headline3: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 53,
            color: Colors.white,
          ),
        ),
        headline4: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        bodyText1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        bodyText2: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        subtitle1: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
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
