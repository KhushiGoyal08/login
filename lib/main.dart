import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginapp/initial.dart';
import 'package:loginapp/last.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/sign_up.dart';
import 'package:loginapp/forgot.dart';
import 'package:loginapp/last.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const First_route(),
        'login': ((context) => const MyLogin()),
        'sign_up': ((context) => const account()),
        'forgot': ((context) => const forgot()),
        'last': ((context) => const aflo()),
      },
    ),
  );
}
