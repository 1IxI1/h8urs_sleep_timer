import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static double w = MediaQuery.of(context).size.width;
  static double h = MediaQuery.of(context).size.height;

  static bool _isDarkTheme = false;

  ThemeMode get currenTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  static BuildContext get context => context;
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
          fixedSize: Size(w / 1.36, h / 12.5),
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
    return ThemeData();
  }
}
