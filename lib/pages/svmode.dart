import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/lib/daynight_timepicker.dart';
import 'package:h8urs_sleep_timer/pages/third.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/ugly_funcs.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'dart:io' show Platform;

class SvModePage extends StatefulWidget {
  SvModePage({Key? key}) : super(key: key);

  @override
  _SvModePageState createState() => _SvModePageState();
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

class _SvModePageState extends State<SvModePage> {
  TimeOfDay now = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    now = TimeOfDay.now();
  }

  TimeOfDay _time = TimeOfDay.now().replacing(hour: 7, minute: 0);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: w / 1.18,
              child: Text(
                'When do you need\nto wake up?',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: h / 16.37),
            createInlinePicker(
              elevation: 0,
              value: _time,
              onChange: onTimeChanged,
              iosStylePicker: false,
              minHour: 4,
              maxHour: 14,
              is24HrFormat: true,
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      FlutterAlarmClock.createAlarm(_time.hour, _time.minute);
                    }
                    Navigator.push(
                      context,
                      FadeRoute(
                        page: ThirdPage(
                          sleeptime: _time.hour,
                          bedtime: _time.minute,
                          armode: false,
                        ),
                      ),
                    );
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
