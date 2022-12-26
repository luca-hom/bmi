import 'package:bmi/presentation/configuration/Settings_Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BaseAppBar.dart';
import '../BmiCalculator.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Settings'),
        appBar: AppBar(),
      ),      // body is the majority of the screen.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Configure Units', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings_Users()),
                      );
                    },
                    child: Text('Configure Users', style: TextStyle(fontSize: 20)),
                  ),
                ]
              ),
            ),
          )

        ],
      ),
    );
  }
}