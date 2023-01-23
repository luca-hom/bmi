import 'package:bmi/data/BmiRepository.dart';
import 'package:bmi/domain/BmiEntry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'BaseAppBar.dart';

class BmiHistory extends StatefulWidget {
  const BmiHistory({super.key});

  @override
  State<StatefulWidget> createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory>{
  String? _activeUser = '';
  List<BmiEntry> _bmiEntries = [];


  @override
  void initState() {
    super.initState();
      _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activeUser = prefs.getString('active_user');
    });
    if (_activeUser != null) {
      _bmiEntries = await BmiRepository.instance.bmiEntriesForUser(_activeUser!);
    }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(AppLocalizations.of(context)!.baseAppBarBMIHistory(_activeUser!)),
        appBar: AppBar(),
      ),
      body: Container(
        child: Padding (
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child:
          Column(
            children: [
              SfCartesianChart(
                  primaryXAxis: NumericAxis(
                      isVisible: false
                  ),
                series: [
                  LineSeries(
                      dataSource: _bmiEntries,
                      dashArray: <double>[5,5],
                      xValueMapper: (BmiEntry data, _) => DateTime.parse(data.date).millisecondsSinceEpoch,
                      yValueMapper: (BmiEntry data, _) => data.value
                  )
                ],
              ),
              ElevatedButton(onPressed: () async => {
                await BmiRepository.instance.deleteUserBmiEntries(_activeUser!),
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(AppLocalizations.of(context)!.bmiHistoryToastDeleteHistory),
                )),
                _loadData()
              }, child: Text(AppLocalizations.of(context)!.bmiHistoryBtnDeleteHistory)),
            ],
          ),
        )
      )

    );
  }
}