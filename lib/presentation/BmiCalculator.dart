import 'package:bmi/presentation/BmiResult.dart';
import 'package:flutter/material.dart';

import 'BaseAppBar.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator ({super.key});

  @override
  Widget build(BuildContext context) {
    var weightController = TextEditingController();
    var heightController = TextEditingController();

    return Scaffold(
        appBar: BaseAppBar(
          title: Text('BMI Calculator'),
          appBar: AppBar(),
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: weightController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Weight (kg)'
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: heightController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Height (cm)'
                    ),
                    keyboardType: TextInputType.number,
                  )
                ]
              ),
            ),
            Expanded(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => {
                          weightController.clear(), heightController.clear()
                        },
                        child: Text('Clear Input'),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BmiResult(weight: weightController.text, height: heightController.text)))
                        },
                        child: Text('Calculate BMI'),
                      )
                    ]
                ),
              )


            ))

          ],

        ));
  }
}
