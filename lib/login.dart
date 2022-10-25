// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginapp/forgot.dart';
import 'package:loginapp/initial.dart';
import 'package:loginapp/last.dart';
import 'package:loginapp/sign_up.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final GlobalKey<_MyLoginState> _formkey = GlobalKey<_MyLoginState>();
  @override
  Widget build(BuildContext context) {
   
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/robook.jpg'),
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          title: const Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              //   color:  Color.fromARGB(255, 102, 171, 192),
              //  fontFamily: 'fonts/PressStart2P-Regular.ttf'
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 200,
                    right: 35,
                    left: 35,
                  ),
               child:  Form( 
                    key:_formkey,
                child: Center(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 102, 171, 192),
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
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 102, 171, 192),
                              filled: true,
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      const  SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: (){
                             Navigator.push(context, MaterialPageRoute(
                             builder: (context) => const forgot(),
                            ),
                            );
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.amber[50],
                          ),
                        child: const Text('Forgot Password ??',
                         style: TextStyle(
                          fontSize: 20,
                          
                       )
                        )
                        ),
                         const  SizedBox(
                          height: 30,
                        ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20,20,20,20),
                            
                             
                          ),
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(
                             builder: (context) => const aflo(),
                            ),
                            );
                          },
                          // ignore: prefer_const_constructors
                          child: Text('SUBMIT',
                          style : const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,


                          ),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                       
                      ],
                    ),
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

