import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h8urs_sleep_timer/pages/first.dart';
import 'package:h8urs_sleep_timer/pages/second.dart';
import 'package:h8urs_sleep_timer/themes.dart';

void main() {
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  );

  runApp(
    MaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      initialRoute: '/0',
      routes: {
        '/0': (context) => FirstPage(),
      },
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
}
