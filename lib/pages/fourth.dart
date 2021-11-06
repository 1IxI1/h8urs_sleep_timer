import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/balls.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {},
      home: FourthPage(
        bedtime: 0,
        sleeptime: 0,
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  final int bedtime;
  final int sleeptime;

  FourthPage({Key? key, required this.bedtime, required this.sleeptime})
      : super(key: key);

  get width => null;

  get height => null;

  @override
  _FourthPageState createState() => _FourthPageState();
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0}) {
    if (minute + this.minute >= 60) {
      hour += 1;
      minute -= 60;
    }
    if (hour + this.hour >= 24) {
      hour -= 24;
    }

    return this.replacing(hour: this.hour + hour, minute: this.minute + minute);
  }
}

class _FourthPageState extends State<FourthPage> {
  var _defaultTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  TimeOfDay now = TimeOfDay.now();
  var isButtonVisible = false;

  get data => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var alarm = now.add(hour: widget.sleeptime, minute: widget.bedtime);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 26,
                  onPressed: () {},
                  icon: Icon(
                    Icons.brightness_4_rounded,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 31,
                )
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: w / 1.18,
              child: Text(
                'You should sleep\nuntil ${alarm.hour < 10 ? '0' + alarm.hour.toString() : alarm.hour.toString()}:${alarm.minute < 10 ? '0' + alarm.minute.toString() : alarm.minute.toString()}',
                style: _defaultTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: h / 16.37),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isButtonVisible) {
                    isButtonVisible = false;
                  } else {
                    isButtonVisible = true;
                  }
                });
              },
              child: Container(
                child: Stack(
                  children: [
                    CircularPercentIndicator(
                        radius: w / 1.31 - 20,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor: Colors.transparent,
                        progressColor: Colors.transparent,
                        center: Container(
                          padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                          child: Balls(),
                        )),
                    CircularPercentIndicator(
                      radius: w / 1.31 - 20,
                      lineWidth: 20.0,
                      animation: false,
                      backgroundColor: Colors.black26,
                      progressColor: Colors.transparent,
                    ),
                    CircularPercentIndicator(
                      radius: w / 1.31 - 20,
                      lineWidth: 20.0,
                      animation: false,
                      backgroundColor: Colors.transparent,
                      percent:
                          widget.sleeptime / 12 + widget.bedtime / (12 * 60),
                      startAngle: now.hour.toDouble() * 30 +
                          now.minute.toDouble() * 0.5 -
                          widget.bedtime.toDouble() * 0.5,
                      progressColor: Color(0xFFA99EF1),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    CircularPercentIndicator(
                      radius: w / 1.31 - 20,
                      lineWidth: 20.0,
                      animation: false,
                      backgroundColor: Colors.transparent,
                      percent: widget.sleeptime / 12,
                      startAngle: now.hour.toDouble() * 30 +
                          now.minute.toDouble() * 0.5,
                      progressColor: Color(0xFF250BC5),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: h / 7.74 + h / 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isButtonVisible ? 1 : 0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.transparent,
                      ),
                      onPressed: () async {
                        LaunchApp.openApp(
                          openStore: false,
                          androidPackageName: 'com.google.android.deskclock',
                        );
                      },
                      child: Text(
                        "Disable alarm",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xFFC50B0B),
                              fontSize: h / 46.88,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
