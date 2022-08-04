/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const StackedHorizontalBarChart({
    required this.seriesList,
    this.animate = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: charts.BarChart(
        seriesList,
        animate: animate,
        barGroupingType: charts.BarGroupingType.stacked,
        vertical: false,
        domainAxis: const charts.OrdinalAxisSpec(
          showAxisLine: true,
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(fontSize: 8),
            labelJustification: charts.TickLabelJustification.inside,
          ),
        ),
        primaryMeasureAxis: const charts.NumericAxisSpec(
            tickProviderSpec:
                charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
        secondaryMeasureAxis: const charts.NumericAxisSpec(
            tickProviderSpec:
                charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
        behaviors: [
          charts.SeriesLegend(
            entryTextStyle: charts.TextStyleSpec(
              color: charts.Color.fromHex(code: '#1A1A1A'),
              fontSize: 8,
            ),
            cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
          )
        ],
      ),
    );
  }
}
