import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

//このモジュールを用いるときは
//android/app/src/main/AndroidManifest.xmlの最後の</manifest>の前に
//    <queries>
//        <intent>
//            <action android:name="android.intent.action.VIEW" />
//            <data android:scheme="https" />
//        </intent>
//        <intent>
//            <action android:name="android.intent.action.DIAL" />
//            <data android:scheme="tel" />
//        </intent>
//        <intent>
//            <action android:name="android.intent.action.SEND" />
//            <data android:mimeType="*/*" />
//        </intent>
//    </queries>
//を挿入する必要があることに注意

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コンテンツ'),
      ),
      body: const Center(
        child: WebView(
          initialUrl: "https://www.google.com/",
        ),
      ),
    );
  }
}
