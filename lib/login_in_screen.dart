import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsetup/const.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future<void> userlogin() async {
    setState(() => loading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful ✅")),
      );

      Navigator.pushReplacementNamed(context, '/HomeScreen');
    } on FirebaseAuthException catch (e) {
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 50),

            MyField(
              Hinttext: 'Email',
              icon: Icons.email,
              controller: _emailController,
            ),

            const SizedBox(height: 30),

            MyField(
              Hinttext: 'Password',
              icon: Icons.lock,
              controller: _passwordController,
            ),

            const SizedBox(height: 100),

            loading
                ? const CircularProgressIndicator()
                : Mybutton(
              text: 'Login',
              onpress: userlogin,
            ),

            const SizedBox(height: 15),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignupScreen');
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(fontSize: 15, color: Colors.black45),
                    ),
                    TextSpan(
                      text: ' Signup',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
