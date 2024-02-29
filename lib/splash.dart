import 'package:at/registration.dart';
import 'package:flutter/material.dart';
import 'registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToRegistrationScreen();
  }

  _navigateToRegistrationScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash.jfif",
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
