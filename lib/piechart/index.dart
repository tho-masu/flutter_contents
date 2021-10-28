import 'package:flutter_contents/piechart/piechart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  // Todoリストのデータ
  List<String> assetList = [];
  List<dynamic> assetListObj = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('パイチャート'),
      ),
      body: SingleChildScrollView(
          child: Column(children: const <Widget>[PieChartWidget()])),
    );
  }
}
