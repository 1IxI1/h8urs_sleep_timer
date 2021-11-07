import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/pages/third.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/ugly_funcs.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

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
      home: SecondPage(),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
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

class _SecondPageState extends State<SecondPage> {
  var _defaultTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  TimeOfDay now = TimeOfDay.now();
  int bedtime = 10;
  int sleeptime = 8;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (now.minute != TimeOfDay.now().minute) {
        setState(() {
          now = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var alarm = now.add(hour: sleeptime, minute: bedtime);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: w / 1.18,
              child: Text(
                'If you will set\nalarm now then it\nwill ring at ${alarm.hour < 10 ? '0' + alarm.hour.toString() : alarm.hour.toString()}:${alarm.minute < 10 ? '0' + alarm.minute.toString() : alarm.minute.toString()}',
                style: _defaultTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: h / 16.37),
            Container(
              child: AspectRatio(
                aspectRatio: 3 / 2.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
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
                          percent: sleeptime / 12 + bedtime / (12 * 60),
                          startAngle: now.hour.toDouble() * 30 +
                              now.minute.toDouble() * 0.5,
                          progressColor: Color(0xFFFFC93E),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        CircularPercentIndicator(
                          radius: w / 1.31 - 20,
                          lineWidth: 20.0,
                          animation: false,
                          backgroundColor: Colors.transparent,
                          percent: sleeptime / 12,
                          startAngle: now.hour.toDouble() * 30 +
                              now.minute.toDouble() * 0.5,
                          progressColor: Color(0xFF250BC5),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${now.hour < 10 ? '0' + now.hour.toString() : now.hour.toString()}:${now.minute < 10 ? '0' + now.minute.toString() : now.minute.toString()}",
                                style: _defaultTextStyle,
                              ),
                              SizedBox(height: 1.5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$sleeptime',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF250BC5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        //color: Colors.black26,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        sleeptime = sleepCorrect(sleeptime);
                                      });
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Text('+',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF250BC5))),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$bedtime',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF250BC5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        //color: Colors.black26,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        bedtime = bedCorrect(bedtime);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                "${alarm.hour < 10 ? '0' + alarm.hour.toString() : alarm.hour.toString()}:${alarm.minute < 10 ? '0' + alarm.minute.toString() : alarm.minute.toString()}",
                                style: _defaultTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.only(bottom: h / 10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    FlutterAlarmClock.createAlarm(alarm.hour, alarm.minute);

                    Navigator.push(
                        context,
                        FadeRoute(
                            page: ThirdPage(
                          sleeptime: sleeptime,
                          bedtime: bedtime,
                        )));
                  },
                  child: Text(
                    'Set',
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
                    primary: Color(0xFF250BC5),
                  ),
                ),
                SizedBox(
                  height: h / 40.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
