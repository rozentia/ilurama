import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class GraphBlock extends StatelessWidget {
  final List<num?> graphData;
  final List<num> graphStops;
  const GraphBlock({
    Key? key,
    required this.graphData,
    required this.graphStops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<num> formattedChartData = graphData.fold<List<num>>(
      [],
      (prev, curr) => [
        ...prev,
        //: if curr is null copy the next non null value
        curr ?? graphData.sublist(prev.length).fold<num?>(null, (prev, curr) => prev = prev ?? curr) ?? 0,
      ],
    );

    final secondaryColorStronger =
        context.isLight ? secondaryColor(context).darken(5) : secondaryColor(context).lighten(20);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 25, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15.0),
          Flexible(
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  LineChartData(
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        LineChartBarData(
                          spots: formattedChartData
                              .asMap()
                              .map<int, FlSpot>((key, value) => MapEntry(key, FlSpot(key.toDouble(), value.toDouble())))
                              .values
                              .toList(),
                          barWidth: 5.0,
                          dotData: FlDotData(show: false),
                          isStrokeCapRound: true,
                          isStrokeJoinRound: true,
                          isCurved: true,
                          gradient: const LinearGradient(colors: [
                            Colors.purple,
                            Colors.indigo,
                            Colors.lightBlue,
                            Colors.green,
                            Colors.yellow,
                            Colors.orange,
                            Colors.red,
                          ]),
                        ),
                      ],
                      // betweenBarsData: [BetweenBarsData()],
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        horizontalInterval: 20,
                      ),
                      titlesData: FlTitlesData(
                          show: true,
                          topTitles: AxisTitles(),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) => Text(
                                        value.toStringAsFixed(0),
                                        style: caption(context).copyWith(color: secondaryColorStronger),
                                      ))),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) => Text(
                                        value.toStringAsFixed(0),
                                        style: caption(context).copyWith(color: secondaryColorStronger),
                                      ))),
                          bottomTitles: AxisTitles()),
                      borderData: FlBorderData(show: false)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class GraphBlockComparing extends StatelessWidget {
  final Color sourceColor;
  final Color targetColor;
  final List<num?> graphData;
  final List<num> graphStops;
  final List<num?> targetGraphData;
  final List<num> targetGraphStops;
  const GraphBlockComparing({
    Key? key,
    required this.graphData,
    required this.graphStops,
    required this.targetGraphData,
    required this.targetGraphStops,
    required this.sourceColor,
    required this.targetColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<num> formattedChartData = graphData.fold<List<num>>(
      [],
      (prev, curr) => [
        ...prev,
        //: if curr is null copy the next non null value
        curr ?? graphData.sublist(prev.length).fold<num?>(null, (prev, curr) => prev = prev ?? curr) ?? 0,
      ],
    );
    final List<num> formattedTargetChartData = targetGraphData.fold<List<num>>(
      [],
      (prev, curr) => [
        ...prev,
        //: if curr is null copy the next non null value
        curr ?? targetGraphData.sublist(prev.length).fold<num?>(null, (prev, curr) => prev = prev ?? curr) ?? 0,
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 25, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'title_transmission_graph'.tr().asSectionHeader,
          const SizedBox(height: 15.0),
          Flexible(
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  LineChartData(
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        if (formattedChartData.isNotEmpty)
                          LineChartBarData(
                            spots: formattedChartData
                                .asMap()
                                .map<int, FlSpot>(
                                    (key, value) => MapEntry(key, FlSpot(key.toDouble(), value.toDouble())))
                                .values
                                .toList(),
                            barWidth: 5.0,
                            dotData: FlDotData(show: false),
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            isCurved: true,
                            color: sourceColor,
                          ),
                        if (formattedTargetChartData.isNotEmpty)
                          LineChartBarData(
                            spots: formattedTargetChartData
                                .asMap()
                                .map<int, FlSpot>(
                                    (key, value) => MapEntry(key, FlSpot(key.toDouble(), value.toDouble())))
                                .values
                                .toList(),
                            barWidth: 5.0,
                            dotData: FlDotData(show: false),
                            isStrokeCapRound: true,
                            isStrokeJoinRound: true,
                            isCurved: true,
                            color: targetColor,
                          ),
                      ],
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        horizontalInterval: 20,
                      ),
                      titlesData: FlTitlesData(
                          show: true,
                          topTitles: AxisTitles(),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) => Text(
                                        value.toStringAsFixed(0),
                                        style: caption(context).copyWith(color: secondaryColor(context)),
                                      ))),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) => Text(
                                        value.toStringAsFixed(0),
                                        style: caption(context).copyWith(color: secondaryColor(context)),
                                      ))),
                          bottomTitles: AxisTitles()),
                      borderData: FlBorderData(show: false)),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 17, right: 24, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: const LinearGradient(colors: [
                Colors.purple,
                Colors.indigo,
                Colors.lightBlue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
