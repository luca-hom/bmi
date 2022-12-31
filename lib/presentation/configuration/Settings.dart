import 'package:bmi/presentation/configuration/Settings_Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../BaseAppBar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(AppLocalizations.of(context)!.baseAppBarSettings),
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
                    child: Text(AppLocalizations.of(context)!.settingsBtnConfigUnits, style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings_Users()),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.settingsBtnConfigUsers, style: TextStyle(fontSize: 20)),
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