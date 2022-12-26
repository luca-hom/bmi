
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BaseAppBar.dart';

class Settings_Users extends StatelessWidget {
  const Settings_Users({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('User Settings'),
        appBar: AppBar(),
      ), // body is the majority of the screen.
      body: Container()
    );
  }
}