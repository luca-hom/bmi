import 'package:bmi/application/BmiUtil.dart';
import 'package:bmi/data/BmiRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../domain/BmiEntry.dart';
import 'BaseAppBar.dart';
import 'BmiRatingDetail.dart';

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
        title: Text(AppLocalizations.of(context)!.baseAppBarBMIResult),
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
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.bmiResultTextWeight,
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: widget.height,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.bmiResultTextHeight,
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: result.toStringAsFixed(2),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.bmiResultTextResult,
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: Rating.getTitle(resultRating, context),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.bmiResultTextRating,
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: _activeUser),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.bmiResultTextUser,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () async => {
                      await BmiRepository.instance.insertBmiEntry(
                        BmiEntry(id : await BmiRepository.instance.getNextEntryId(),
                            user: _activeUser!,
                            value: result, date: DateTime.now().toIso8601String())
                      ),
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(AppLocalizations.of(context)!.bmiResultToastSaveBMI),
                    )),
                    }, child: Text(AppLocalizations.of(context)!.bmiResultBtnSaveBMI)),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BmiRatingDetail(rating: resultRating)))
                    }, child: Text(AppLocalizations.of(context)!.bmiResultBtnDetails))
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