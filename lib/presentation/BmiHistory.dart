import 'package:bmi/data/BmiRepository.dart';
import 'package:bmi/domain/BmiEntry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseAppBar.dart';

class BmiHistory extends StatefulWidget {
  const BmiHistory({super.key});

  @override
  State<StatefulWidget> createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory>{
  String? _activeUser = "NULL";
  late List<BmiEntry> _bmiEntries;

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
    _bmiEntries = await BmiRepository.instance.bmiEntriesForUser(_activeUser!);
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('$_activeUser');
    for (var element in _bmiEntries) {
      debugPrint("${element.value}, ${element.date}");
    }

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('BMI History of $_activeUser'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}