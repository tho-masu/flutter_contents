import 'package:flutter/material.dart';
import 'list_add_page.dart';

class AssetListPage extends StatefulWidget {
  const AssetListPage({Key? key}) : super(key: key);

  @override
  _AssetListPageState createState() => _AssetListPageState();
}

class _AssetListPageState extends State<AssetListPage> {
  // Todoリストのデータ
  static List<String> assetList = [];
  static List<dynamic> assetListObj = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('銘柄リスト'),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        ListView.builder(
          itemCount: assetList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(assetList[index]),
              ),
            );
          },
        ),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          final newListObj = await Navigator.of(context).push(
            // 遷移先の画面としてリスト追加画面を指定
            MaterialPageRoute(builder: (context) => const ListAddPage()),
          );
          if (newListObj != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() => assetListObj.add(newListObj));
            String cardText =
                "${newListObj["code_name"]}   始値:${newListObj["o"]}, 高値:${newListObj["h"]}, 安値:${newListObj["l"]}, 終値:${newListObj["c"]}";
            setState(() => assetList.add(cardText));
          }
        },
        child: const Icon(Icons.add_chart),
      ),
    );
  }
}
