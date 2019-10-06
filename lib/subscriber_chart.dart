import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bar_chart/subscriber_series.dart';
import 'package:flutter/material.dart';

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor,
          id: "Subscribers",
          data: data)
    ];

    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "World of Warcraft Subscribers by Year",
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
