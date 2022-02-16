import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/adds/balls_dark.dart';
import 'package:h8urs_sleep_timer/adds/dialogs.dart';
import 'package:h8urs_sleep_timer/pages/armode.dart';
import 'package:h8urs_sleep_timer/pages/sleepscreen.dart';
import 'package:h8urs_sleep_timer/pages/svmode.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/balls.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class NoalarmsPage extends StatefulWidget {
  NoalarmsPage({Key? key}) : super(key: key);

  @override
  _NoalarmsPageState createState() => _NoalarmsPageState();
}

class _NoalarmsPageState extends State<NoalarmsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    var brightness = EasyDynamicTheme.of(context).themeMode;
    bool darkModeOn = brightness == ThemeMode.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Container(
            child: EasyDynamicThemeBtn(),
            //SizedBox(width: 31),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No alarms found',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 30),
            Tooltip(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              message: "New alarm",
              child: InkWell(
                onLongPress: () {
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(
                      page: SleepScreen(hours: 1, minutes: 0, armode: false),
                    ),
                  );
                },
                onTap: () => showGeneralDialog(
                  barrierLabel: "",
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 200),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return Dialogs.ChoseModeDialog(context, w);
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: anim1.drive(tween),
                      child: child,
                    );
                  },
                ),
                //Dialogs.choseMode(context);

                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 7,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF907DFF),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Color(0xFF907DFF),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
