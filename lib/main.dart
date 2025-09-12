import 'package:flutter/material.dart';
import 'package:ostad_assignment/travel_homepage.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelHomePage(),
    );
  }
}
