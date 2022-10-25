import 'dart:ui';
import 'package:flutter/material.dart';

class aflo extends StatefulWidget {
  const aflo({super.key});

  @override
  State<aflo> createState() => _afloState();
}

class _afloState extends State<aflo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         title: const Text('welcome',
         style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
         ),),
      ),
    );
  }
}