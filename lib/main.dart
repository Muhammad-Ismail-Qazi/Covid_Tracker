import 'package:covid_tracker/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CovidTracker());
}

class CovidTracker extends StatefulWidget {
  const CovidTracker({super.key});

  @override
  State<CovidTracker> createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
      ),
      home: const SplashScreen(),
    );
  }
}
