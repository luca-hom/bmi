import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../application/BmiUtil.dart';
import 'BaseAppBar.dart';

class BmiRatingDetail extends StatelessWidget {
  const BmiRatingDetail({super.key, required this.rating});
  final Rating rating;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(AppLocalizations.of(context)!.baseAppBarBMIRatingDetail),
        appBar: AppBar(),
      ),
      body: Container(
        alignment: Alignment.center,
      child: Padding (
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Rating.getTitle(rating, context)!, style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Text(Rating.getDescription(rating, context)!, style: TextStyle(fontSize: 22, color: Colors.black54),)
          ],
        )
        )
      )
    );
  }
}