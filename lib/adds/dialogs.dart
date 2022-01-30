import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/pages/noalarms.dart';

class Dialogs {
  static removeApprove(context) async {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        double w = MediaQuery.of(context).size.width;
        double h = MediaQuery.of(context).size.height;

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).backgroundColor,
            ),
            height: w / 1.46,
            width: w / 1.36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: w / 11.54),
                    AutoSizeText(
                      'Do you really want to disable alarm?',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                      maxFontSize: 36,
                      minFontSize: 22,
                      maxLines: 2,
                    ),
                    SizedBox(height: w / 14.98),
                    Text(
                      'You will be redirected in your\nclock app where you need to\nturn it off',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: w / 24.96),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          // height: 45,
                          height: w / 5.95,
                          minWidth: w / 1.36 / 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: w / 78.6),
                              Text(
                                'No',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // SizedBox(width: 44),
                        MaterialButton(
                          // height: 45,
                          // minWidth: 75,
                          height: w / 5.95,
                          minWidth: w / 1.36 / 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Yes',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: w / 15.115,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: w / 78.6),
                            ],
                          ),
                          onPressed: () async {
                            LaunchApp.openApp(
                              openStore: false,
                              androidPackageName:
                                  'com.google.android.deskclock',
                            );
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              FadeRoute(
                                page: NoalarmsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  static choseAlarm(context) async {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        double w = MediaQuery.of(context).size.width;
        double h = MediaQuery.of(context).size.height;

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).backgroundColor,
            ),
            height: w / 1.46,
            width: w / 1.36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: w / 11.54),
                    AutoSizeText(
                      'Do you really want to disable alarm?',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                      maxFontSize: 36,
                      minFontSize: 22,
                      maxLines: 2,
                    ),
                    SizedBox(height: w / 14.98),
                    Text(
                      'You will be redirected in your\nclock app where you need to\nturn it off',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: w / 24.96),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          // height: 45,
                          height: w / 5.95,
                          minWidth: w / 1.36 / 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: w / 78.6),
                              Text(
                                'No',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // SizedBox(width: 44),
                        MaterialButton(
                          // height: 45,
                          // minWidth: 75,
                          height: w / 5.95,
                          minWidth: w / 1.36 / 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Yes',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: w / 15.115,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: w / 78.6),
                            ],
                          ),
                          onPressed: () async {
                            LaunchApp.openApp(
                              openStore: false,
                              androidPackageName:
                              'com.google.android.deskclock',
                            );
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              FadeRoute(
                                page: NoalarmsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
