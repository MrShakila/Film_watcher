import 'dart:async';

import 'package:films/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  navigateTo() async {
    Timer.periodic(const Duration(seconds: 7), (timer) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Center(
            child: Lottie.asset("images/45732-cinema-animation.json",
                repeat: false)));
  }
}
