import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': ((context) => const MyLogin())
      },
  ),
  );
}

