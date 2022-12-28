
import 'package:bmi/application/BmiUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseAppBar.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key, required this.weight, required this.height});
  final String weight;
  final String height;

  @override
  State<StatefulWidget> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  String? _activeUser = "placeholder";

  @override
  void initState() {
    super.initState();
    _loadActiveUser();
  }

  Future<void> _loadActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activeUser = prefs.getString('active_user');
      print('active User: $_activeUser');
    });
  }

  @override
  Widget build(BuildContext context) {

    debugPrint('weight: $widget.weight');
    debugPrint('height: $widget.height');

    var result = BmiUtil.bmiUtilString(widget.height, widget.weight).getBMI();
    debugPrint('result: $result');

    var resultRating = BmiUtil.bmiUtilString(widget.height, widget.weight).getRating();
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
                  initialValue: widget.weight,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Weight (kg)',
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: widget.height,
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
                TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: _activeUser),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Active User',
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => {}, child: Text('Save my BMI Data')),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () => {}, child: Text('Show BMI Details'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}