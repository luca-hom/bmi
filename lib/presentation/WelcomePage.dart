import 'package:bmi/presentation/BmiCalculator.dart';
import 'package:flutter/material.dart';

import 'BaseAppBar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Welcome Page'),
        appBar: AppBar(),
      ),
      // body is the majority of the screen.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text('Body mass index (BMI) is a value derived from the mass (weight) '
                      'and height of a person. The BMI is defined as the body mass divided by '
                      'the square of the body height, and is expressed in units of kg/m2, '
                      'resulting from mass in kilograms and height in metres.')),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiCalculator()),
            );
          },
          child: Text('Open BMI Calculator', style: TextStyle(fontSize: 20)),
        ),
        ],
      ),
      );
  }
}