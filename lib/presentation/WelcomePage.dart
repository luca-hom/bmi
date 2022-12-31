import 'package:bmi/presentation/BmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'BaseAppBar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(AppLocalizations.of(context)!.baseAppBarWelcomePage),
        appBar: AppBar(),
      ),
      // body is the majority of the screen.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(AppLocalizations.of(context)!.welcomePageText)),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiCalculator()),
            );
          },
          child: Text(AppLocalizations.of(context)!.welcomePageBtn, style: TextStyle(fontSize: 20)),
        ),
        ],
      ),
      );
  }
}