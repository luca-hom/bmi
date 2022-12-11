import 'package:flutter/material.dart';

import 'BaseAppBar.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('BMI Calculator'),
          appBar: AppBar(),
        ),
        body: Container(

        ));
  }
}
