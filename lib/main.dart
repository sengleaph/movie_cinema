import 'packa'
    'ge:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/view/navigation/navigation_bar.dart';


void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BottonNavigationBar(),
    );
  }
}
