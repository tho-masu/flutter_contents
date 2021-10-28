import 'package:flutter/material.dart';
import 'popup/popup.dart';
import 'assetlist/asset_list_page.dart';
import 'piechart/index.dart';
import 'web/webview2.dart';

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
              // 銘柄リストボタン
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
              // パイチャートボタン
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
                // アラートボタン
                child: Alert()),
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
        child: const Icon(Icons.web),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<WebViewScreen>(
              builder: (BuildContext _context) => WebViewScreen(),
            ),
          );
        },
      ),
    );
  }
}
