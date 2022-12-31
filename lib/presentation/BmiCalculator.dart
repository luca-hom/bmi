import 'package:bmi/presentation/BmiResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'BaseAppBar.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator ({super.key});

  @override
  Widget build(BuildContext context) {
    var weightController = TextEditingController();
    var heightController = TextEditingController();

    return Scaffold(
        appBar: BaseAppBar(
          title: Text(AppLocalizations.of(context)!.baseAppBarBMICalculator),
          appBar: AppBar(),
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: weightController,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.bmiCalculatorInputWeight
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: heightController,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.bmiCalculatorInputHeight
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
                        child: Text(AppLocalizations.of(context)!.bmiCalculatorBtnClear),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          if (weightController.text != "" && heightController.text != "") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BmiResult(weight: weightController.text, height: heightController.text)))
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.bmiCalculatorBtnCalculateBMI),
                      )
                    ]
                ),
              )


            ))

          ],

        ));
  }
}
