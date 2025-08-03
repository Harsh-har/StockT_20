import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            Column(
              children: [
                Image.asset(
                  'assets/bat_icon.png',
                  height: 130,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Stock T20',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff447c46),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Your winning fantasy cricket experience\nstarts here',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                // button removed (not needed if auto move)
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xff5f9658)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
