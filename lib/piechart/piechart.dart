import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'indicator.dart';
import 'package:tuple/tuple.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartState();
}

class PieChartState extends State {
  int touchedIndex = -1;
  List<Tuple3<String, String, double>> data = [
    const Tuple3("stock", "\$", 14),
    const Tuple3("bond", "\$", 6),
    const Tuple3("commodity", "\$", 4),
    const Tuple3("REIT", "\$", 2)
  ]; //("assetname","currency",amount)
  List<PieChartSectionData> sectionData = [];
  List<Indicator> indicatorData = [];

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    data.forEach((tuple) => sum += tuple.item3);
    data.forEach((tuple) {
      sectionData.add(generateSectionData(
          "${tuple.item1}\n${(100 * tuple.item3 / sum).toStringAsFixed(1)}%",
          tuple.item3));
      indicatorData
          .add(generateIndicator(tuple.item1, tuple.item2, tuple.item3));
    });

    return Card(
        child: Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.3,
        child: PieChart(
          PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 2,
              startDegreeOffset: 270,
              centerSpaceRadius: 40,
              sections: showingSections()),
        ),
      ),
      Wrap(children: showingIndicators()),
      const SizedBox(
        height: 15,
      ),
    ]));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(data.length, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 110.0 : 100.0;

      return sectionData[i].copyWith(radius: radius);
    });
  }

  List<Widget> showingIndicators() {
    List<Widget> lst = [];
    for (int i = 0; i < data.length; i++) {
      lst.add(indicatorData[i]);
    }
    return lst;
  }

  PieChartSectionData generateSectionData(String title, double value) {
    return PieChartSectionData(
      color: const Color(0xff0293ee),
      value: value,
      title: title,
      radius: 100.0,
      titleStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff)),
    );
  }

  Indicator generateIndicator(String title, String currency, double value) {
    return Indicator(
      color: const Color(0xff0293ee),
      text: "$title: $currency$value",
      isSquare: true,
    );
  }
}
