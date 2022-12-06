import 'package:flutter/material.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('BMI Calculator'),
        actions: const [
        ],
      ),
    );
  }

}
