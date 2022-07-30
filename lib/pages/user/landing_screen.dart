import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.5,
                1,
              ],
              colors: [
                Color.fromARGB(110, 5, 249, 220),
                Color(0xFFFFFFFF),
              ]),
        ),
        child: Center(
          child: Container(
            height: mediaQuery.size.height * 0.35,
            width: mediaQuery.size.width * 0.75,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
