import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;
  const SimpleBarChart({
    Key? key,
    required this.seriesList,
    required this.animate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 100,
      child: charts.BarChart(
        seriesList,
        animate: animate,
        // barGroupingType: charts.BarGroupingType.stacked,
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
