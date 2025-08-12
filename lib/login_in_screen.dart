import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
