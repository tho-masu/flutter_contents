import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListAddPage extends StatefulWidget {
  const ListAddPage({Key? key}) : super(key: key);

  @override
  _ListAddPageState createState() => _ListAddPageState();
}

class _ListAddPageState extends State<ListAddPage> {
  String _text = "";
  static const _url = "http://localhost:5000/code/";
  final _tickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: const TextStyle(color: Colors.orange)),
            // テキスト入力
            TextField(
              //onChanged: (String value) => setState(() => _text = value),
              controller: _tickerController,
            ),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              // キャンセルボタン
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.orange),
                ),
                // ボタンをクリックした時の処理
                onPressed: () async {
                  Uri uri = Uri.parse(_url + _tickerController.text);
                  http.Response res = await http.get(uri);
                  print(res.statusCode);
                  setState(() => _text = res.body);
                },
                child: const Text('リクエスト'),
              ),
            ),
            SizedBox(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                // "pop"の引数から前の画面にデータを渡す
                onPressed: () async {
                  var json = jsonDecode(_text);
                  Navigator.of(context).pop(json);
                },
                child: const Text('銘柄リスト追加',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                // ボタンをクリックした時の処理
                onPressed: () {
                  // "pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
