
import 'package:bmi/application/BmiUtil.dart';
import 'package:flutter/cupertino.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.weight, required this.height});

  final String weight;
  final String height;

  @override
  Widget build(BuildContext context) {

    debugPrint('weight: $weight');
    debugPrint('height: $height');

    var result = BmiUtil.bmiUtilString(height, weight).getBMI();

    debugPrint('result: $result');

    // TODO: implement build
    throw UnimplementedError();
  }

}