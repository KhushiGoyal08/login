import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';

class verify extends StatefulWidget {
  const verify({super.key});
  @override
  State<verify> createState() => _verifyState();
}
    final _auth= FirebaseAuth.instance;

class _verifyState extends State<verify> {
  
  User? user =FirebaseAuth.instance.currentUser;
  emailverify() async{

        await user!.sendEmailVerification();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: prefer_const_constructors
          SnackBar(
            content: const Text('Verification Email Has Been Sent',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
        ),
        ),
        
 );
 

 Navigator.pushReplacement(context,MaterialPageRoute(builder: (((context) => const MyLogin()))));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/robook.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
          backgroundColor: Colors.transparent,
          title: const Text('Verify your Account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Center(
            child: Column(
            
              children:  [
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.fromLTRB(20,20,20,20),
                                
                                 
                              ),
             onPressed: () {
              emailverify();
               
             },
              child: const Text('Using Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              )
            ]),
          ),
        ) ,
        ),
        
    );
  }
}