import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginsetup/home_screen.dart';
import 'package:loginsetup/login_in_screen.dart';
import 'package:loginsetup/signup_screen.dart';
import 'package:loginsetup/splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginSetup',
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
        '/SignupScreen': (context) => const SignupScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
      },
      home: SplashScreen(),
    );
  }
}
