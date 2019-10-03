// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class SneakerStatWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SneakerStatWidget(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory SneakerStatWidget.withSampleData() {
    return new SneakerStatWidget(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
        seriesList,
        animate: animate,
        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...))
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto)
        ]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<SneakerStats, int>> _createSampleData() {
    final random = new Random();
    final data = [
      new SneakerStats("Style", random.nextInt(100), 0, charts.MaterialPalette.purple.shadeDefault),
      new SneakerStats("Comfort", random.nextInt(100), 1, charts.MaterialPalette.blue.shadeDefault),
      new SneakerStats("Rarity", random.nextInt(100), 2, charts.MaterialPalette.deepOrange.shadeDefault),
      new SneakerStats("Price", random.nextInt(100), 3, charts.MaterialPalette.green.shadeDefault),
    ];

    return [
      new charts.Series<SneakerStats, int>(
        id: 'Rating',
        colorFn: (SneakerStats sales, _) => sales.color ,
        domainFn: (SneakerStats sales, _) => sales.category,
        measureFn: (SneakerStats sales, _) => sales.rating,
        data: data,
        //Set a label accessor to control the text of the arc.
        labelAccessorFn: (SneakerStats row, _) => '${row.metric}',
      )
    ];
  }
}

// Sample data type.
class SneakerStats {
  final int category;
  final String metric;
  final int rating;
  charts.Color color;
  SneakerStats(this.metric, this.rating, this.category, this.color);
}