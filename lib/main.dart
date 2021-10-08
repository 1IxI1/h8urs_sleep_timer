import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h8urs_sleep_timer/pages/first.dart';
import 'package:h8urs_sleep_timer/pages/second.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white),
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF36BDF8),
        highlightColor: Color(0xFF000000), //Color(0xFFCCCCCC),
      ),
      initialRoute: '/0',
      routes: {
        '/0': (context) => FirstPage(),
        '/1': (context) => SecondPage(),
      },
    ),
  );
}
