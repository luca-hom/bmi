import 'package:flutter/material.dart';

import '../application/BmiUtil.dart';
import 'BaseAppBar.dart';

class BmiRatingLegend extends StatelessWidget {

  final List<Rating> ratings = Rating.getDescriptions();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('All BMI Ratings'),
        appBar: AppBar(),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: ratings.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              height: 50,
              child: Center(child: Text('${ratings[index]}')),
            ),
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(index.toString())))
          );
          },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

}