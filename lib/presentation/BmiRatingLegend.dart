import 'package:bmi/presentation/BmiRatingDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../application/BmiUtil.dart';
import 'BaseAppBar.dart';

class BmiRatingLegend extends StatelessWidget {

  final List<Rating> ratings = Rating.getRatings();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(AppLocalizations.of(context)!.baseAppBarBMIRatingLegend),
        appBar: AppBar(),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: ratings.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              height: 50,
              child: Center(child: Text(Rating.getTitle(ratings[index], context)!)),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiRatingDetail(rating: ratings[index])))
          );
          },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

}