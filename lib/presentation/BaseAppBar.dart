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
          onSelected: handleClick,
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

  //TODO: Logic to switch to other screens -> NavService?
  void handleClick(String value) {
    switch (value) {
      case 'Home':
        break;
      case 'Calculator':
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
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}