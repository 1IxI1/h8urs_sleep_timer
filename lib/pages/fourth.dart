import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/adds/balls_dark.dart';
import 'package:h8urs_sleep_timer/adds/dialogs.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/adds/balls.dart';
import 'package:lottie/lottie.dart';

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

    var brightness = EasyDynamicTheme.of(context).themeMode;
    bool darkModeOn = brightness == ThemeMode.dark;

    var svgChert = darkModeOn ? DarkBalls() : Balls();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              EasyDynamicThemeBtn(),
              SizedBox(width: 31),
            ],
          )
        ],
      ),
      body: Visibility(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: w / 1.18,
                child: Text(
                  'You should sleep\nuntil ${alarm.hour < 10 ? '0' + alarm.hour.toString() : alarm.hour.toString()}:${alarm.minute < 10 ? '0' + alarm.minute.toString() : alarm.minute.toString()}',
                  style: Theme.of(context).textTheme.headline2,
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
                        radius: (w / 1.31 - 20)/2,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor: Colors.transparent,
                        progressColor: Colors.transparent,
                        center: Container(
                          //padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_ldqqbtdk.json', width: w/1.8),
                        ),
                      ),
                      CircularPercentIndicator(
                        radius: (w / 1.31 - 20)/2,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor:
                            Theme.of(context).unselectedWidgetColor,
                        progressColor: Colors.transparent,
                      ),
                      CircularPercentIndicator(
                        radius: (w / 1.31 - 20)/2,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor: Colors.transparent,
                        percent:
                            widget.sleeptime / 12 + widget.bedtime / (12 * 60),
                        startAngle: now.hour.toDouble() * 30 +
                            now.minute.toDouble() * 0.5 -
                            widget.bedtime.toDouble() * 0.5,
                        progressColor: Color(0xFF9A4AFF),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      CircularPercentIndicator(
                        radius: (w / 1.31 - 20)/2,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor: Colors.transparent,
                        percent: widget.sleeptime / 12,
                        startAngle: now.hour.toDouble() * 30 +
                            now.minute.toDouble() * 0.5,
                        progressColor: Theme.of(context).primaryColor,
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
                        // onPressed: () async {
                        //   LaunchApp.openApp(
                        //     openStore: false,
                        //     androidPackageName: 'com.google.android.deskclock',
                        //   );
                        // },
                        onPressed: () => Dialogs.removeApprove(context),
                        child: Text(
                          "Disable alarm",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: h / 46.88,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: h / 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
