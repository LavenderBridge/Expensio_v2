import 'package:collection/collection.dart';
List testData = [
  ["Food", 0, 180, "Food"],
  ["Chips", 0, 20, "Food"],
  ["Allowance", 1, 4000, "Misc"],
  ["Big Basket", 0, 230, "Misc"],
  ["Shawarma", 0, 90, "Food"],
  ["Fried Rice", 0, 130, "Food"],
  ["Fried Rice", 0, 130, "Food"],
  ["VMart", 0, 75, "Misc"],
  ["Big Basket", 0, 230, "Misc"],
];

final testFirebaseData = <String, dynamic> {
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};


class LineChartData_{
  final double x; final double y;
  LineChartData_({required this.x, required this.y});
}

List<LineChartData_> get lineChartData{
  // List<int> extractedValues = testData.map((item) => item[2] as int).toList();
  List<int> extractedValues = [];
  for (var item in testData){
    if (item[1] == 0) extractedValues.add(item[2]);
  }
  final data = extractedValues; 
  return data.mapIndexed((index, element) => LineChartData_(x: index.toDouble(), y: element.toDouble())).toList();
}