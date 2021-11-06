import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h8urs_sleep_timer/pages/fourth.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {},
      home: ThirdPage(
        sleeptime: 0,
        bedtime: 0,
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final int bedtime;
  final int sleeptime;
  ThirdPage({Key? key, required this.bedtime, required this.sleeptime})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late Permission permission;
  PermissionStatus permissionStatus = PermissionStatus.denied;
  var _defaultTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
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
                                style: _defaultTextStyle,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 52),
                            SvgPicture.asset(
                              'ass/sleep_baba.svg',
                              width: w / 1.21,
                            ),
                          ],
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
                            page: FourthPage(
                                sleeptime: widget.sleeptime,
                                bedtime: widget.bedtime)));
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
