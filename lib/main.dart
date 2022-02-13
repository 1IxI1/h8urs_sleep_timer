import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/pages/intro.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:h8urs_sleep_timer/pages/noalarms.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        scaffoldBackgroundColor: Color(0xFFDDDDDD),
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
        shadowColor: Colors.grey.withOpacity(0.1),
      ),
      darkTheme: ThemeData(
        primaryColor: Color(0xFF3918FF),
        backgroundColor: Color(0xFF1D1D1D),
        scaffoldBackgroundColor: Color(0xFF484848),
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
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Splash(),
    );
  }
}
class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NoalarmsPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FirstPage()));
    }
  }
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text('Loading...'),
      // ),
    );
  }
}

