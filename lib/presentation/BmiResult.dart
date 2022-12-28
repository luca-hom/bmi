
import 'package:bmi/application/BmiUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BaseAppBar.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.weight, required this.height});

  //TODO: change BmiResult to StatefulWidget use SharedPreference ActiveUser

  final String weight;
  final String height;

  @override
  Widget build(BuildContext context) {

    debugPrint('weight: $weight');
    debugPrint('height: $height');

    var result = BmiUtil.bmiUtilString(height, weight).getBMI();

    debugPrint('result: $result');

    var resultRating = BmiUtil.bmiUtilString(height, weight).getRating();
    debugPrint('resultRating: $resultRating');


    return Scaffold(
      appBar: BaseAppBar(
        title: Text('BMI Result'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                TextFormField(
                  readOnly: true,
                  initialValue: weight,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Weight (kg)',
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: height,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Height (cm)',
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: result.toStringAsFixed(2),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'BMI Result',
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: resultRating.toString() ,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'BMI Rating',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }

}