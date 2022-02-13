import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h8urs_sleep_timer/adds/route_animations.dart';
import 'package:h8urs_sleep_timer/pages/noalarms.dart';
import 'package:h8urs_sleep_timer/pages/armode.dart';
import 'package:h8urs_sleep_timer/pages/svmode.dart';

class Dialogs {
  static removeApprove(context) async => showDialog(
        useSafeArea: false,
        context: context,
        builder: (BuildContext context) {
          double w = MediaQuery.of(context).size.width;
          //double h = MediaQuery.of(context).size.height;

          return Dialog(
            //elevation: 10,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
              ),
              height: w / 1.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: w / 12),
                      Text(
                        'Do you really want to\ndisable alarm?',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: w / 14.98),
                      Text(
                        'You will be redirected in your\nclock app where you need to\nturn it off',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: baton(w, context, 'No',
                                Theme.of(context).focusColor, 'left'),
                          ),

                          // SizedBox(width: 44),
                          Expanded(
                            child: baton(w, context, 'Yes',
                                Theme.of(context).errorColor, 'right'),
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
  static choseMode(context) async => showDialog(
        useSafeArea: false,
        context: context,
        builder: (BuildContext context) {
          double w = MediaQuery.of(context).size.width;
          return ChoseModeDialog(context, w);
        },
      );

  static MaterialButton baton(w, context, text, textcolor, circle) {
    double r = 0;
    double l = 0;
    if (circle == 'left') {
      l = 20;
    } else
      r = 20;
    return MaterialButton(
      height: w / 5.95,
      //minWidth: w / 1.36 / 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(l), bottomRight: Radius.circular(r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: l / 20 * (w / 78.6)),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: textcolor)),
          SizedBox(width: r / 20 * (w / 78.6)),
        ],
      ),
      onPressed: () {
        Navigator.of(context).pop();
        if (text == 'Yes') {
          LaunchApp.openApp(
            openStore: false,
            androidPackageName: 'com.google.android.deskclock',
          );
          Navigator.pushReplacement(
            context,
            FadeRoute(
              page: NoalarmsPage(),
            ),
          );
        }
      },
    );
  }

  static Dialog ChoseModeDialog(context, w) {
    return Dialog(
      alignment: AlignmentDirectional.center,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).backgroundColor,
        ),
        height: 270,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: w / 12),
                Text(
                  'Alarm type',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    Navigator.push(context, FadeRoute(page: SecondPage()));
                  },
                  child: Text('From sleep time'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 17),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    Navigator.push(context, FadeRoute(page: SvModePage()));
                  },
                  child: Text('To get up time'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 28),
              ],
            )
          ],
        ),
      ),
    );
  }
}
