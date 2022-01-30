import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/pages/first.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp1(),
    ),
  );
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    MediaQueryData mq = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    double w = mq.size.width;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF250BC5),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        unselectedWidgetColor: Colors.black26,
        canvasColor: Color(0xFFFFC93E),
        errorColor: Color(0xFFC50B0B),
        focusColor: Colors.black,
        bottomAppBarColor: Color(0xFF250BC5).withOpacity(0.12),
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 8.19,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          headline2: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 10.92,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          headline3: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 7.42,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          headline4: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 15.12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          bodyText1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 28.07,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          bodyText2: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 16.38,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          subtitle1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 21.83,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          button: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 16.37,
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
      ),
      darkTheme: ThemeData(
        primaryColor: Color(0xFF3918FF),
        backgroundColor: Color(0xFF1D1D1D),
        scaffoldBackgroundColor: Color(0xFF1D1D1D),
        unselectedWidgetColor: Color(0xFFBFBFBF).withOpacity(0.33),
        canvasColor: Color(0xFFFFC93E),
        errorColor: Color(0xFFC50B0B),
        bottomAppBarColor: Color(0xFFC5BCFF).withOpacity(0.12),
        focusColor: Colors.white,
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 8.19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          headline2: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 10.92,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          headline3: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 7.42,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          headline4: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 15.12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          bodyText1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 28.07,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          bodyText2: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 16.38,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          subtitle1: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 21.83,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          button: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: w / 16.37,
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
      ),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: FirstPage(),

    );
  }
}
