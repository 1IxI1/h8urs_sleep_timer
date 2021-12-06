import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h8urs_sleep_timer/pages/second.dart';
import 'package:h8urs_sleep_timer/pages/fourth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    var svgWindow = SvgPicture.asset((darkModeOn)
        ? 'ass/undraw_starry_window_ppm0_dark.svg'
        : 'ass/undraw_starry_window_ppm0.svg');

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'You want to\nsleep ',
                    style: Theme.of(context).textTheme.headline1,
                    children: [
                      TextSpan(
                        text: '8',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' hours',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h / 13.61),
                AspectRatio(
                  aspectRatio: 2.8 / 2,
                  child: svgWindow,
                ),
                SizedBox(height: h / 7.5),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //print(h);
                    Navigator.push(context, FadeRoute(page: SecondPage()));
                  },
                  onLongPress: () {
                    // Navigator.push(context,
                    //     FadeRoute(page: FourthPage(sleeptime: 8, bedtime: 0)));
                    setState(() {
                      currentTheme.toggleTheme();
                    });
                    print(currentTheme.currenTheme);
                  },
                  child: Text(
                    'Yeah',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: w / 15.7, fontWeight: FontWeight.w600),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(w / 1.36, h / 12.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: h / 40.5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
