import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class DarkBalls extends StatefulWidget {
  final double? width;
  final double? height;

  DarkBalls({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _DarkBallsState createState() => new _DarkBallsState();
}

class _DarkBallsState extends State<DarkBalls> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      height: this.widget.height,
      child: Center(
        child: WebView(
          backgroundColor: Colors.transparent,
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _loadHtmlFromAssets(webViewController);
          },
        ),
      ),
    );
  }

  _loadHtmlFromAssets(webViewController) async {
    const String svg =
        "<center><svg id='scene' viewBox='3 0 300 310' width='700'><path d='m 156.80917,203.12844 c 16.80622,0 30.43079,-13.64787 30.43079,-30.48205 0,-16.83574 -13.62457,-30.4836 -30.43234,-30.4836 -16.80622,0 -30.43233,13.64786 -30.43233,30.4836 0,16.83418 13.62456,30.48205 30.43388,30.48205 z' fill='#ffffff' id='path2' style='stroke-width:.999999'/><path d='m 192.77678,193.59901 h -27.26466 v 9.26066 h 27.26466 z' fill='#ffffff' id='path4' style='stroke-width:.999999'/><path d='m 192.96942,202.85967 c 1.59549,0 2.88803,-3.45507 2.88803,-7.71644 0,-4.26292 -1.29254,-7.718 -2.88803,-7.718 -1.59549,0 -2.88959,3.45508 -2.88959,7.718 0,4.26137 1.2941,7.71644 2.88959,7.71644 z m -6.55284,-9.96908 h -27.26466 v 9.26067 h 27.26466 z' fill='#ffffff' id='path6' style='stroke-width:.999999'/><path d='m 186.60922,202.15126 c 1.59548,0 2.88959,-3.45508 2.88959,-7.71645 0,-4.26136 -1.29411,-7.71644 -2.88959,-7.71644 -1.59549,0 -2.88959,3.45508 -2.88959,7.71644 0,4.26137 1.2941,7.71645 2.88959,7.71645 z' fill='#ffffff' id='path8' style='stroke-width:.999999'/><path d='m 127.28722,144.29735 c -2.45615,-11.02238 5.39855,-22.15972 17.54415,-24.87686 12.14869,-2.71715 23.98668,4.0159 26.44439,15.03828 2.45615,11.02394 -5.59275,15.08956 -17.74145,17.8067 -12.14559,2.71559 -23.78939,3.05582 -26.24709,-7.96812 z' fill='#7862FF' id='path10' style='stroke-width:.999999'/><path d='m 168.50424,170.90953 a 7.5890527,7.5890527 0 0 1 -7.30631,-5.04125 0.70996869,0.70996869 0 0 1 0.44587,-0.89639 0.68200494,0.68200494 0 0 1 0.27342,-0.0342 0.69132619,0.69132619 0 0 1 0.48315,0.2408 c 0.0621,0.0699 0.10875,0.1507 0.13671,0.23925 1.07195,3.19097 4.73365,4.85948 8.16542,3.71762 a 6.787425,6.787425 0 0 0 3.93823,-3.36031 5.8257825,5.8257825 0 0 0 0.34178,-4.48507 0.70996869,0.70996869 0 0 1 0.71929,-0.93213 0.71307578,0.71307578 0 0 1 0.62142,0.4816 7.2332916,7.2332916 0 0 1 -0.41791,5.56945 8.2151301,8.2151301 0 0 1 -4.7585,4.07028 8.3533953,8.3533953 0 0 1 -2.64102,0.43033 z m 13.55621,4.14329 a 6.7843179,6.7843179 0 0 1 -2.94241,9.11774 6.7641219,6.7641219 0 0 1 -9.1022,-2.94707 l -0.006,-0.0124 c -1.69802,-3.3339 0.64938,-5.40166 3.97707,-7.10279 3.32613,-1.69958 6.37573,-2.38779 8.07376,0.94455 z' fill='#000000' id='path12' style='stroke-width:.999999'/><path d='M 290.67634,203.40341 H 21.452167 a 0.70375453,0.70375453 0 0 1 -0.706861,-0.70841 0.70686161,0.70686161 0 0 1 0.706861,-0.70842 H 290.67789 a 0.70530807,0.70530807 0 0 1 0.70686,0.70842 0.70841515,0.70841515 0 0 1 -0.70686,0.70841 z' fill='#ffffff' id='path14' style='stroke-width:.999999'/><path d='m 150,212.99964 c 2.83366,-0.73172 3.2438,-8.65789 0.91659,-17.70106 -2.33031,-9.04316 -6.51556,-15.78088 -9.34922,-15.04916 -2.83521,0.73172 -3.24535,8.65789 -0.91659,17.70106 2.33032,9.04317 6.51401,15.78088 9.34922,15.04916 z' fill='#ffffff' id='path16' style='stroke-width:.999999'/><path d='m 206.83323,135.54625 h -17.29248 a 0.82027018,0.82027018 0 0 1 -0.75968,-0.52044 0.80007413,0.80007413 0 0 1 0.21283,-0.89484 l 15.72496,-14.18383 h -14.52873 a 0.81560955,0.81560955 0 0 1 -0.81561,-0.81251 0.81560955,0.81560955 0 0 1 0.81561,-0.8125 h 16.6431 a 0.81560955,0.81560955 0 0 1 0.79386,0.99893 0.82337726,0.82337726 0 0 1 -0.24546,0.41479 l -15.72495,14.1854 h 15.17655 a 0.81560955,0.81560955 0 0 1 0.81561,0.8125 0.81560955,0.81560955 0 0 1 -0.81561,0.8125 z m 22.36479,-24.11408 h -17.29248 a 0.81405601,0.81405601 0 0 1 -0.54685,-1.41372 l 15.7234,-14.18539 h -14.52872 a 0.81871663,0.81871663 0 0 1 -0.81561,-0.8125 0.81405601,0.81405601 0 0 1 0.81561,-0.81251 h 16.64465 a 0.82027018,0.82027018 0 0 1 0.76123,0.52044 0.80473476,0.80473476 0 0 1 -0.21439,0.89329 l -15.72495,14.18539 h 15.17811 a 0.81871663,0.81871663 0 0 1 0.81561,0.8125 0.81405601,0.81405601 0 0 1 -0.81561,0.8125 z M 218.87628,83.87389 h -17.29247 a 0.81560955,0.81560955 0 0 1 -0.79386,-1.000479 0.82337726,0.82337726 0 0 1 0.24546,-0.413243 l 15.72495,-14.185392 h -14.52872 a 0.81871663,0.81871663 0 0 1 -0.81561,-0.812502 0.81405601,0.81405601 0 0 1 0.81561,-0.812503 h 16.64464 a 0.82027018,0.82027018 0 0 1 0.76124,0.520437 0.80473476,0.80473476 0 0 1 -0.21439,0.893287 l -15.72495,14.185392 h 15.1781 a 0.81871663,0.81871663 0 0 1 0.81561,0.812503 0.81405601,0.81405601 0 0 1 -0.81561,0.8125 z' fill='#cbcbcb' id='path18' style='stroke-width:.999999'/><path d='m 164.39046,46.436642 9.04006,-7.24417 c -7.02356,-0.77677 -9.91004,3.06048 -11.09074,6.09765 -5.48711,-2.28371 -11.46048,0.70842 -11.46048,0.70842 l 18.08945,6.57769 a 13.710008,13.710008 0 0 0 -4.57984,-6.14115 z m -68.814143,13.77836 9.041613,-7.24261 c -7.023562,-0.77677 -9.910043,3.06047 -11.090735,6.09765 -5.487111,-2.28371 -11.46048,0.70841 -11.46048,0.70841 l 18.089445,6.5777 a 13.710008,13.710008 0 0 0 -4.579843,-6.14115 z M 199.8485,8.0361819 208.89012,0.79357189 c -7.02357,-0.77677 -9.91005,3.06048001 -11.09074,6.09765001 -5.48711,-2.2837 -11.46048,0.70842 -11.46048,0.70842 l 18.08944,6.5777001 A 13.714669,13.714669 0 0 0 199.8485,8.0361819 Z' fill='#ffffff' id='path20' style='stroke-width:.999999'/>";
    const String balls =
        "<line id='string' x1='150' y1='212.99965' x2='250' y2='212.99965' stroke='white' stroke-width='4' stroke-linecap='round' style='fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1'/><ellipse id='ball' cx='250' cy='212' fill='white' style='fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-width:.999966' rx='9' ry='9'/><line id='string1' x1='150' y1='212' x2='250' y2='212.99965' stroke='white' stroke-width='4' stroke-linecap='round' style='fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1'/><ellipse id='ball1' cx='250' cy='212.99966' fill='white' style='fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-width:.999966' rx='9' ry='9'/></svg>";
    String fileText = '<!doctype html><html><body>' +
        svg +
        balls +
        "<script>in_angle = 45;var cx = 150, cy = 50;var radius = 40;var g = 9.81;var angle = 15;var vel = 0;var dx = 0.01;var acc, vel, penx, peny;var timerFunction = null;if(!timerFunction) timerFunction = setInterval(swing, dx * 1000);function swing(){acc = g * Math.cos(angle); vel += acc * dx;angle += vel/(radius/50) * dx;setPenPos();}function setPenPos(){penx = cx + radius * Math.cos(angle);peny = cy + radius * Math.sin(angle);scene.getElementById('string').setAttribute('x2', penx);scene.getElementById('string').setAttribute('y2', peny+163);scene.getElementById('ball').setAttribute('cx', penx);scene.getElementById('ball').setAttribute('cy', peny+163);scene.getElementById('string1').setAttribute('x2', penx-13.5);scene.getElementById('string1').setAttribute('y2', peny-13.5+163);scene.getElementById('ball1').setAttribute('cx', penx-13.5);scene.getElementById('ball1').setAttribute('cy', peny-13.5+163);}</script></body></html>";
    String dataUrl = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    webViewController.loadUrl(dataUrl);
  }
}
