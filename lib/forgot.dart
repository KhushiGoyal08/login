import 'dart:ui';
import 'package:flutter/material.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  @override
  Widget build(BuildContext context) {
    return 
     Container(
       child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: const Text(
          'Enter your Email for Regain Your Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:Colors.orange,
          ),

        ),
       ),
     );
  }
}
