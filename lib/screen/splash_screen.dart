import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aygazhcm/screen/login_page.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: AnimatedSplashScreen(
        duration: 1000,
        splash: Image.asset(
          "images/loading.gif",
        ),
        splashIconSize: double.infinity,
        nextScreen: const Login_page(),
        backgroundColor: Colors.white,
      )),
    );
  }
}
