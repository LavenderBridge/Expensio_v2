import 'package:collection/collection.dart';
List testData = [
  ["Food", 0, 2500, "Food"],
  ["Chips", 0, 20, "Food"],
  ["Allowance", 1, 4000, "Misc"],
  ["Big Basket", 0, 230, "Misc"],
];

class LineChartData_{
  final double x; final double y;
  LineChartData_({required this.x, required this.y});
}

List<LineChartData_> get lineChartData{
  List<int> extractedValues = testData.map((item) => item[2] as int).toList();
  final data = extractedValues; 
  return data.mapIndexed((index, element) => LineChartData_(x: index.toDouble(), y: element.toDouble())).toList();
}