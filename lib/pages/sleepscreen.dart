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

class SleepScreen extends StatefulWidget {
  final int bedtime;
  final int sleeptime;

  SleepScreen({Key? key, required this.bedtime, required this.sleeptime})
      : super(key: key);

  get width => null;

  get height => null;

  @override
  _SleepScreenState createState() => _SleepScreenState();
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

class _SleepScreenState extends State<SleepScreen> {
  TimeOfDay now = TimeOfDay.now();
  var isButtonVisible = false;

  get data => null;

  @override
  void initState() {
    super.initState();
  }

  bool _isMusic = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var alarm = now.add(hour: widget.sleeptime, minute: widget.bedtime);

    var brightness = EasyDynamicTheme.of(context).themeMode;
    bool darkModeOn;
    if (brightness == ThemeMode.system) {
      var b = MediaQuery.of(context).platformBrightness;
      darkModeOn = b == Brightness.dark;
    } else
      darkModeOn = brightness == ThemeMode.dark;

    String _chertMode = 'chert';
    Container svgChert = darkModeOn
        ? Container(
            padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
            child: DarkBalls(),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(0, 55, 0, 0), child: Balls());

    if (_chertMode == 'cat') {
      svgChert = Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Lottie.asset('ass/lf20_ldqqbtdk.json', width: w / 1.8),
      );
    }



    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Row(
            children: [
              IconButton(
                tooltip: _isMusic
                    ? 'Sleeping music enabled'
                    : 'Sleeping music disabled',
                icon: Icon(_isMusic
                    ? Icons.music_note_rounded
                    : Icons.music_off_rounded),
                onPressed: () => setState(() {
                  _isMusic = !_isMusic;
                }),
                color: Theme.of(context).focusColor,
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Theme.of(context).focusColor,
                  size: 28,
                ),
                tooltip: 'Menu',
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).scaffoldBackgroundColor,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Theme: '),
                        Text(
                          brightness == ThemeMode.system
                              ? 'System'
                              : (darkModeOn ? 'Dark' : 'Light'),
                        )
                      ],
                    ),
                    value: 1,
                    onTap: () {
                      setState(() {
                        EasyDynamicTheme.of(context).changeTheme();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Theme: '),
                        Text(
                          brightness == ThemeMode.system
                              ? 'System'
                              : (darkModeOn ? 'Dark' : 'Light'),
                        )
                      ],
                    ),
                    value: 2,
                    onTap: () {
                      setState(() {
                        EasyDynamicTheme.of(context).changeTheme();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(width: 20),
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
                          radius: (w / 1.31 - 20) / 2,
                          lineWidth: 20.0,
                          animation: false,
                          backgroundColor: Colors.transparent,
                          progressColor: Colors.transparent,
                          center: svgChert),
                      CircularPercentIndicator(
                        radius: (w / 1.31 - 20) / 2,
                        lineWidth: 20.0,
                        animation: false,
                        backgroundColor:
                            Theme.of(context).unselectedWidgetColor,
                        progressColor: Colors.transparent,
                      ),
                      CircularPercentIndicator(
                        radius: (w / 1.31 - 20) / 2,
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
                        radius: (w / 1.31 - 20) / 2,
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
