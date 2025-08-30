import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sipalinggo/widgets/navigation.dart';
import 'package:sipalinggo/widgets/views.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  //mengatur waktu splash screen
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Navigation()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textView(
              EdgeInsets.all(0),
              'Sipalinggo',
              TextAlign.left,
              const Color.fromARGB(255, 247, 249, 247),
              FontWeight.bold,
              20.0,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 400,
              height: 400,
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
