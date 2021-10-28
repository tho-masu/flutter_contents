import 'package:flutter/material.dart';
import 'package:flutter_contents/contents.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      title: 'flutter_contents',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン画面'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text('ユーザID: '),
                ),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _userController,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text('パスワード: '),
                ),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: const Text('ログイン'),
                onPressed: () async {
                  String usrid = _userController.text;
                  String password = _passwordController.text;
                  // "push"で新規画面に遷移
                  final obj = await Navigator.of(context).push(
                    // 遷移先の画面としてコンテンツ画面を指定
                    MaterialPageRoute(
                        builder: (context) => const ContentsPage()),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              child: Text(_text),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_chart),
        onPressed: () async {
          String url = 'https://flutter.dev/';
          await canLaunch(url)
              ? await launch(url)
              : throw 'Could not launch $url';
        },
      ),
    );
  }
}
