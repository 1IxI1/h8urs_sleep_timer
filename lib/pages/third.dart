import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h8urs_sleep_timer/pages/sleepscreen.dart';

class ThirdPage extends StatefulWidget {
  final int bedtime;
  final int sleeptime;
  final bool armode;
  ThirdPage(
      {Key? key,
      required this.bedtime,
      required this.sleeptime,
      required this.armode})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    var svgBaba = SvgPicture.asset(
        (darkModeOn) ? 'ass/sleep_baba_dark.svg' : 'ass/sleep_baba.svg',
        width: w / 1.21);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: (w - w / 1.21) / 1.9),
                    Stack(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 65),
                            Container(
                              width: w / 1.56,
                              child: Text(
                                'Now, go to bed',
                                style: Theme.of(context).textTheme.headline1,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [SizedBox(height: 52), svgBaba],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h / 7.15),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadeRoute(
                        page: SleepScreen(
                          hours: widget.sleeptime,
                          minutes: widget.bedtime,
                          armode: widget.armode,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Zzzz',
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
