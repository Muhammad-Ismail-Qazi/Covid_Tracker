import 'dart:async';
import 'package:covid_tracker/views/word_status.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController =
  AnimationController(vsync: this, duration: const Duration(seconds: 3))
    ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WordStatus()),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreenAccent.withOpacity(0.4), Colors.lightGreen],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: animationController.value * 2 * 3.14159265359,
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            'https://www.pngmart.com/files/6/Virus-PNG-Free-Download.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Covid Tracker",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
