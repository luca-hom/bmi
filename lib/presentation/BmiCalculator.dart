
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
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Weight (kg)'
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
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
                        onPressed: () => {},
                        child: Text('Clear Input'),
                      ),
                      ElevatedButton(
                        onPressed: () => {},
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
