import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/login.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final _auth = FirebaseAuth.instance;
  var emaily = "";
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  sending() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emaily);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            "Email sent successfully",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => MyLogin()),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('No User Found For This Email'),
        ));
      }
    }
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
          title: const Text('Reset Password'),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 100,
                  right: 20,
                  left: 20,
                ),
                child: Form(
                  key: _formkey,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Enter Your Email for Reset Link!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: email,
                          validator: ((txt) {
                            var nonNullValue = txt ?? '';
                            if (nonNullValue.isEmpty) {
                              return "Enter Email";
                            } else if (RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                .hasMatch(nonNullValue)) {
                              return null;
                            } else {
                              return "Enter valid email";
                            }
                          }),
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 102, 171, 192),
                              filled: true,
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                emaily = email.text;
                              });
                              sending();
                            }
                          },
                          child: const Text(
                            'Send Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
