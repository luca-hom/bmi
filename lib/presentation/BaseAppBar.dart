import 'package:bmi/presentation/BmiCalculator.dart';
import 'package:bmi/presentation/WelcomePage.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;


  const BaseAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (choice) => handleClick(choice, context),
          itemBuilder: (BuildContext context) {
            return {'Home', 'Calculator', 'Rating', 'History', 'Settings'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void handleClick(String value, BuildContext context) {
    switch (value) {
      case 'Home':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage())
        );
        break;
      case 'Calculator':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BmiCalculator())
        );
        break;
      case 'Rating':
        break;
      case 'History':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}