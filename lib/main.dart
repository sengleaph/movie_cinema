import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/view/navigation/navigation_bar.dart';

void main() async {
  // Add this to ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Specify the .env file name
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Your App Name', // Add your app name
      theme: ThemeData.dark(),
      // Fix the class name typo (Botton -> Bottom)
      home: BottonNavigationBar(initialIndex: 0,),
    );
  }
}