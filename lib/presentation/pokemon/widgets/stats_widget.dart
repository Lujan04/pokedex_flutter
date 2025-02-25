import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  const ChartData(this.x, this.y);

  final String x;
  final double y;
}

class StatsWidget extends StatelessWidget {
  final List<String> types;
  final double height;
  final double weight;
  final List<String> abilities;
  final Map<String, int> stats;

  const StatsWidget({
    Key? key,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFF9C4), Color(0xFFFFF176)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.brown, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _infoColumn("Tipos", types.join(", ")),
                  _infoColumn("Altura", "${height.toStringAsFixed(1)} m"),
                  _infoColumn("Peso", "${weight.toStringAsFixed(1)} kg"),
                  _infoColumn("Habilidades", abilities.join(", ")),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF0D47A1),
                    ),
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  primaryYAxis: const NumericAxis(
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF0D47A1),
                    ),
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  series: <CartesianSeries>[
                    BarSeries<ChartData, String>(
                      dataSource: stats.entries
                          .map((entry) =>
                              ChartData(entry.key, entry.value.toDouble()))
                          .toList(),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoColumn(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
