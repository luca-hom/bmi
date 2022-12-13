
import 'package:flutter/cupertino.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.weight, required this.height});

  final String weight;
  final String height;

  @override
  Widget build(BuildContext context) {

    debugPrint('weight: $weight');
    debugPrint('height: $height');

    // TODO: implement build
    throw UnimplementedError();
  }

}