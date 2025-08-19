import 'package:flutter/material.dart';
import 'package:loginsetup/home_screen.dart';
import 'package:loginsetup/login_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return; // Prevents Navigator error if widget disposed

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _goTo(const HomeScreen());
    } else {
      _goTo(const LoginScreen());
    }
  }

  void _goTo(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          child: const Center(
            child: Text(
              "Splash Screen",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
