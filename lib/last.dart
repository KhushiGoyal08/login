import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/initial.dart';

class aflo extends StatefulWidget {
  const aflo({super.key});

  @override
  State<aflo> createState() => _afloState();
}

class _afloState extends State<aflo> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  logOut() async{
    await _auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push
    (context, MaterialPageRoute(builder: (context) => const First_route()),);
  }
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         logOut();
      },
      child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}