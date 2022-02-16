import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/pages/third.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/ugly_funcs.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'dart:io' show Platform;

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
  TimeOfDay now = TimeOfDay.now();
  int bedtime = 10;
  int sleeptime = 8;

  @override
  void initState() {
    super.initState();
    now = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var alarm = now.add(hour: sleeptime, minute: bedtime);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: w / 1.18,
              child: Text(
                'You will sleep\nuntill',
                style: Theme.of(context).textTheme.headline2,
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
                        //background
                        CircularPercentIndicator(
                          radius: (w / 1.31 - 20)/2,
                          lineWidth: w / 20,
                          animation: false,
                          backgroundColor:
                              Theme.of(context).unselectedWidgetColor,
                          progressColor: Colors.transparent,
                        ),
                        // yellow/bedtime
                        CircularPercentIndicator(
                          radius: (w / 1.31 - 20)/2,
                          lineWidth: w / 20,
                          animation: true,
                          backgroundColor: Colors.transparent,
                          percent: bedtime / (12 * 60),
                          startAngle: now.hour.toDouble() * 30 +
                              now.minute.toDouble() * 0.5 +
                              sleeptime / 12 * 360,
                          progressColor: Theme.of(context).canvasColor,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        // purple/sleeptime
                        CircularPercentIndicator(
                          radius: (w / 1.31 - 20)/2,
                          lineWidth: w / 20,
                          animation: false,
                          backgroundColor: Colors.transparent,
                          percent: sleeptime / 12,
                          startAngle: now.hour.toDouble() * 30 +
                              now.minute.toDouble() * 0.5,
                          progressColor: Theme.of(context).primaryColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "${alarm.hour < 10 ? '0' + alarm.hour.toString() : alarm.hour.toString()}:${alarm.minute < 10 ? '0' + alarm.minute.toString() : alarm.minute.toString()}",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.only(bottom: h / 40.19),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('hrs', style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(height: 3),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () {
                        setState(() {
                          sleeptime = sleepCorrect(sleeptime);
                        });
                      },
                      child: Ink(
                        height: 46,
                        width: 76,
                        child: Center(
                          child: Text(
                            '$sleeptime',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 6,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      '+',
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text('mins', style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(height: 3),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      splashColor: Theme.of(context).canvasColor,
                      onTap: () {
                        setState(() {
                          bedtime = bedCorrect(bedtime);
                        });
                      },
                      child: Ink(
                        height: 46,
                        width: 76,
                        child: Center(
                          child: Text(
                            '$bedtime',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 6,
                                color: Theme.of(context).canvasColor)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      FlutterAlarmClock.createAlarm(alarm.hour, alarm.minute);
                    }
                    Navigator.push(
                      context,
                      FadeRoute(
                        page: ThirdPage(
                          sleeptime: sleeptime,
                          bedtime: bedtime,
                          armode: true,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    if (now.minute != TimeOfDay.now().minute) {
                      setState(() {
                        now = TimeOfDay.now();
                      });
                    }
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
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: h / 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
