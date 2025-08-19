import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsetup/const.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future<void> userauth() async {
    setState(() => loading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup Successful ✅")),
      );

      // Optional: Redirect to Login or Home
      // Navigator.pushReplacementNamed(context, '/LoginScreen');

    } on FirebaseAuthException catch (e) {
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Signup failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Signup",
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
                controller: _emailController, // ✅ fixed
              ),

              const SizedBox(height: 50),

              MyField(
                Hinttext: 'Password',
                icon: Icons.lock,
                controller: _passwordController, // ✅ fixed
              ),

              const SizedBox(height: 100),

              loading
                  ? const CircularProgressIndicator()
                  : Mybutton(
                text: 'Signup',
                onpress: userauth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
