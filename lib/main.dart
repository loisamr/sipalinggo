import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sipalinggo/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sipalinggo',
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
