import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final dynamic Hinttext;
  final dynamic icon;
  final dynamic controller;
   const MyField({super.key, required this.Hinttext, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          hintText: Hinttext,
        ),
      ),
    );
  }
}




class Mybutton extends StatelessWidget {
  final dynamic text;
  var onpress;
  Mybutton({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress;
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
