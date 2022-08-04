/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PiramideChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesLeft;
  final List<charts.Series<dynamic, String>> seriesRight;
  final bool animate;

  const PiramideChart({
    required this.seriesLeft,
    required this.seriesRight,
    this.animate = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          width: 160,
          child: charts.BarChart(
            seriesLeft,
            animate: animate,
            barGroupingType: charts.BarGroupingType.stacked,
            domainAxis: const charts.OrdinalAxisSpec(
              showAxisLine: true,
              renderSpec: charts.SmallTickRendererSpec(
                labelStyle: charts.TextStyleSpec(fontSize: 10),
                labelJustification: charts.TickLabelJustification.outside,
              ),
            ),
            vertical: false,
            behaviors: [
              charts.SeriesLegend(
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.Color.fromHex(code: '#1A1A1A')))
            ],
          ),
        ),
        SizedBox(
          height: 250,
          width: 160,
          child: charts.BarChart(
            seriesRight,
            animate: animate,
            barGroupingType: charts.BarGroupingType.stacked,
            vertical: false,
            domainAxis: const charts.OrdinalAxisSpec(
              showAxisLine: true,
              renderSpec: charts.SmallTickRendererSpec(
                labelStyle: charts.TextStyleSpec(fontSize: 10),
                labelJustification: charts.TickLabelJustification.outside,
              ),
            ),
            behaviors: [
              charts.SeriesLegend(
                entryTextStyle: charts.TextStyleSpec(
                  color: charts.Color.fromHex(code: '#1A1A1A'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
