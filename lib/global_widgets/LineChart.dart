import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/testdata/testdata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AllTransactionsGraph extends StatelessWidget {
  final List<LineChartData_> dataList;

  AllTransactionsGraph({required this.dataList, super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        // minX: ,
        borderData: FlBorderData(
          show: false,
        ),
        gridData: const FlGridData(show: false),
        backgroundColor: Colors.white,
        lineBarsData: [
          LineChartBarData(
            spots: dataList.map((point) => FlSpot(point.x, point.y)).toList(),
            isCurved: true,
            curveSmoothness: 0.3,
            barWidth: 3,
            dotData: const FlDotData(show: false),
            color: ConfigClass.greyColor,
            isStrokeCapRound: true,
          )
        ],
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(" "),
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: 100,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: ConfigClass.textLightGrey,
                    fontSize: 10
                  ),
                );
              },
              reservedSize: 40,
            )
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: ConfigClass.textLightGrey,
                      fontSize: 10
                    ),
                  ),
                );
              },
              reservedSize: 35
            )
          ) ,
        ),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Jan';
      break;
    case 1:
      text = 'Feb';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Apr';
      break;
    case 4:
      text = 'May';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
      break;
    case 7:
      text = 'Aug';
      break;
    case 8:
      text = 'Sep';
      break;
    case 9:
      text = 'Oct';
      break;
    case 10:
      text = 'Nov';
      break;
    case 11:
      text = 'Dec';
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: ConfigClass.textLightGrey,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
