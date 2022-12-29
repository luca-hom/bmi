import 'package:bmi/presentation/WelcomePage.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: "BMI App",
      home: WelcomePage(),
    );
  }
}

