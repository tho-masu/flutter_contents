import 'package:flutter/material.dart';
import 'package:flutter_contents/assetlist/asset_list_page.dart';
import 'package:flutter_contents/piechart/index.dart';
import 'web/webview.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  _ContentsPageState createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コンテンツ'),
      ),
      body: Container(
        // 余白を付ける
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              // キャンセルボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                // "pop"の引数から前の画面にデータを渡す
                onPressed: () async {
                  final obj = await Navigator.of(context).push(
                    // 遷移先の画面として銘柄リスト画面を指定
                    MaterialPageRoute(
                        builder: (context) => const AssetListPage()),
                  );
                },
                child: const Text('銘柄リストページへ',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                // "pop"の引数から前の画面にデータを渡す
                onPressed: () async {
                  final obj = await Navigator.of(context).push(
                    // 遷移先の画面としてパイチャート画面を指定
                    MaterialPageRoute(
                        builder: (context) => const PieChartPage()),
                  );
                },
                child: const Text('パイチャートページへ',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                child: const Text('ログイン画面に戻る'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ac_unit_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<WebViewExample>(
              builder: (BuildContext _context) => WebViewExample(),
            ),
          );
        },
      ),
    );
  }
}
