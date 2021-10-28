import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool _isLoading = false;
  String _title = '';

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
        title: Text(_title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        if (_isLoading) const LinearProgressIndicator(),
        Expanded(
          child: _buildWebView(),
        ),
      ],
    );
  }

  Widget _buildWebView() {
    return WebView(
      initialUrl: 'https://flutter.dev',
      // jsを有効化
      javascriptMode: JavascriptMode.unrestricted,
      // controllerを登録
      onWebViewCreated: _controller.complete,
      // ページの読み込み開始
      onPageStarted: (String url) {
        // ローディング開始
        setState(() {
          _isLoading = true;
        });
      },
      // ページ読み込み終了
      onPageFinished: (String url) async {
        // ローディング終了
        setState(() {
          _isLoading = false;
        });
        // ページタイトル取得
        final controller = await _controller.future;
        final title = await controller.getTitle();
        setState(() {
          if (title != null) {
            _title = title;
          }
        });
      },
    );
  }
}
