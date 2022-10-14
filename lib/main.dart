import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginapp/initial.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/sign_up.dart';
import 'package:loginapp/forgot.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'sign_up',
      routes: {
        '/': (context) => const First_route(),
        'login': ((context) => const MyLogin()),
        'sign_up': ((context) => const account()),
        'forgot': ((context) => const forgot()),
      },
    ),
  );
}
