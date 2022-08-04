import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const HorizontalBarLabelChart({
    Key? key,
    required this.seriesList,
    required this.animate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: charts.BarChart(
        seriesList,
        animate: animate,
        vertical: false,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
      ),
    );
  }
}
