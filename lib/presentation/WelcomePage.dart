import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Welcome Page'),
        actions: const [
        ],
      ),
      // body is the majority of the screen.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Body mass index (BMI) is a value derived from the mass (weight) '
              'and height of a person. The BMI is defined as the body mass divided by '
              'the square of the body height, and is expressed in units of kg/m2, '
              'resulting from mass in kilograms and height in metres.'),
        TextButton(
          onPressed: null,
          child: Text('Open BMI Calculator', style: TextStyle(fontSize: 20)),
        ),
        ],
      ),
      );
  }
}