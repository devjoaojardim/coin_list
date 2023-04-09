import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bitcoin',
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => SplashScreen(),
      '/home': (context) => HomeScreen(),
    },
  ));
}

