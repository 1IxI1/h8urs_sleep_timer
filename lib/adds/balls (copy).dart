import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Balls extends StatefulWidget {
  final double? width;
  final double? height;

  Balls({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _BallsState createState() => new _BallsState();
}

class _BallsState extends State<Balls> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: this.widget.width,
      // height: this.widget.height,
      child: Center(
        child: WebView(
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
    const String Svg =
        "<center><svg id='scene' height=200 width=300><path d='M88.19 130.611c10.818 0 19.588-8.785 19.588-19.621 0-10.837-8.77-19.622-19.589-19.622-10.818 0-19.589 8.785-19.589 19.622 0 10.836 8.77 19.621 19.59 19.621Z' fill='#2F2E41'/><path d='M111.342 124.477h-17.55v5.961h17.55v-5.961Z' fill='#2F2E41'/><path d='M111.466 130.438c1.027 0 1.859-2.224 1.859-4.967 0-2.744-.832-4.968-1.859-4.968-1.027 0-1.86 2.224-1.86 4.968 0 2.743.833 4.967 1.86 4.967ZM107.248 124.021h-17.55v5.961h17.55v-5.961Z' fill='#2F2E41'/><path d='M107.372 129.982c1.027 0 1.86-2.224 1.86-4.967 0-2.743-.833-4.967-1.86-4.967-1.027 0-1.86 2.224-1.86 4.967 0 2.743.833 4.967 1.86 4.967Z' fill='#2F2E41'/><path d='M69.187 92.742c-1.581-7.095 3.475-14.264 11.293-16.013 7.82-1.749 15.44 2.585 17.022 9.68 1.581 7.096-3.6 9.713-11.42 11.462-7.818 1.748-15.313 1.967-16.895-5.129Z' fill='#6C63FF'/><path d='M95.718 109.872a4.885 4.885 0 0 1-4.703-3.245.457.457 0 0 1 .287-.577.439.439 0 0 1 .176-.022.445.445 0 0 1 .311.155c.04.045.07.097.088.154.69 2.054 3.047 3.128 5.256 2.393a4.369 4.369 0 0 0 2.535-2.163 3.75 3.75 0 0 0 .22-2.887.457.457 0 0 1 .463-.6.459.459 0 0 1 .4.31 4.656 4.656 0 0 1-.269 3.585 5.288 5.288 0 0 1-3.063 2.62 5.377 5.377 0 0 1-1.7.277ZM104.444 112.539a4.367 4.367 0 0 1-1.894 5.869 4.354 4.354 0 0 1-5.859-1.897l-.004-.008c-1.093-2.146.418-3.477 2.56-4.572 2.141-1.094 4.104-1.537 5.197.608Z' fill='#fff'/><path d='M174.359 130.788H1.062a.453.453 0 0 1-.455-.456.455.455 0 0 1 .455-.456H174.36a.454.454 0 0 1 .455.456.456.456 0 0 1-.455.456Z' fill='#3F3D56'/><path d='M83.807 136.965c1.824-.471 2.088-5.573.59-11.394-1.5-5.821-4.194-10.158-6.018-9.687-1.825.471-2.089 5.573-.59 11.394 1.5 5.821 4.193 10.158 6.018 9.687Z' fill='#2F2E41'/><path d='M120.39 87.109h-11.131a.528.528 0 0 1-.489-.335.515.515 0 0 1 .137-.576l10.122-9.13h-9.352a.525.525 0 0 1-.525-.523.525.525 0 0 1 .525-.523h10.713a.525.525 0 0 1 .511.643.53.53 0 0 1-.158.267l-10.122 9.131h9.769a.525.525 0 0 1 .525.523.525.525 0 0 1-.525.523ZM134.786 71.587h-11.131a.524.524 0 0 1-.352-.91l10.121-9.131h-9.352a.527.527 0 0 1-.525-.523.524.524 0 0 1 .525-.523h10.714a.528.528 0 0 1 .49.335.518.518 0 0 1-.138.575l-10.122 9.131h9.77a.527.527 0 0 1 .525.523.524.524 0 0 1-.525.523ZM128.142 53.848h-11.131a.525.525 0 0 1-.511-.644.53.53 0 0 1 .158-.266l10.122-9.131h-9.352a.527.527 0 0 1-.525-.523.524.524 0 0 1 .525-.523h10.714a.528.528 0 0 1 .49.335.518.518 0 0 1-.138.575l-10.122 9.131h9.77a.527.527 0 0 1 .525.523.524.524 0 0 1-.525.523Z' fill='#CBCBCB'/><path d='m93.07 29.75 5.819-4.663c-4.521-.5-6.379 1.97-7.139 3.925-3.532-1.47-7.377.456-7.377.456l11.644 4.234a8.825 8.825 0 0 0-2.948-3.953ZM48.775 38.619l5.82-4.662c-4.521-.5-6.379 1.97-7.139 3.925-3.532-1.47-7.377.456-7.377.456l11.644 4.234a8.825 8.825 0 0 0-2.948-3.953ZM115.894 5.032l5.82-4.662c-4.521-.5-6.379 1.97-7.139 3.925-3.532-1.47-7.377.456-7.377.456l11.644 4.234a8.828 8.828 0 0 0-2.948-3.953Z' fill='#3F3D56'/><line id='string' x1='150' y1='50' x2='250' y2='50' stroke='black' stroke-width='4' stroke-linecap='round'/><circle id='ball' cx='250' cy='50' r='18' fill='black' /><line id='string1' x1='150' y1='50' x2='250' y2='50' stroke='black' stroke-width='4' stroke-linecap='round'/><circle id='ball1' cx='250' cy='50' r='18' fill='black' /></svg><script>in_angle = 45;var cx = 150, cy = 50;var radius = 100;var g = 9.81;var angle = -10;var vel = 0;var dx = 0.03;var acc, vel, penx, peny;var timerFunction = null;if(!timerFunction) timerFunction = setInterval(swing, dx * 1000);function swing(){acc = g * Math.cos(angle); vel += acc * dx;angle += vel/(radius/100) * dx;setPenPos();}function setPenPos(){penx = cx + radius * Math.cos(angle);peny = cy + radius * Math.sin(angle);scene.getElementById('string').setAttribute('x2', penx);scene.getElementById('string').setAttribute('y2', peny);scene.getElementById('ball').setAttribute('cx', penx);scene.getElementById('ball').setAttribute('cy', peny);scene.getElementById('string1').setAttribute('x2', penx-25);scene.getElementById('string1').setAttribute('y2', peny-26);scene.getElementById('ball1').setAttribute('cx', penx-25);scene.getElementById('ball1').setAttribute('cy', peny-26);}</script>";
    String fileText = '<!doctype html><html><body>' + Svg + "</body></html>";
    String dataUrl = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    webViewController.loadUrl(dataUrl);
  }
}
