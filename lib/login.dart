// ignore_for_file: unused_label
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final  _erkey = GlobalKey<FormState>();
 var em="";
  var pas="";
   final    email = TextEditingController();
  final    password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final storage = FlutterSecureStorage();
  @override
  void dispose(){
  //clean the controller when the widget is disposed
  email.dispose();
  password.dispose();
  super.dispose();
}
 
loginstate() async{ 
         
          try{
           
 UserCredential userCredential=  await FirebaseAuth.instance.signInWithEmailAndPassword(email: em, password: pas);
 await storage.write(key: "uid", value: userCredential.user?.uid);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Welcome",
                    style:  TextStyle(fontSize: 20.0),
          ),
          ),

        );
        if(UserCredential!=null){
        Navigator.pushReplacement(context , MaterialPageRoute(builder: ((context) => const aflo()),),);
        }
          }
         
      on FirebaseAuthException catch(e){
         if(e.code == 'user-not-found'){
           ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("No Such User Exists",
                    style:  TextStyle(fontSize: 18.0,
                    color: Colors.black,
                    ),
          ),
          ),

        );

    }  else if(e.code== 'wrong-password'){
      
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Wrong Password,Enter Again",
                    style:  TextStyle(fontSize: 16.0,
                   color: Colors.black,
                   ),
          ),
          ),

        );
      } 
      else if(e.code=='email-not-verified'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("First Verify your Email",
                    style:  TextStyle(fontSize: 16.0,
                   color: Colors.black,
                   ),
          ),
          ),

        );
      }
        }
       
  }

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
                    key:_erkey,
                child: Center(
                    child: Column(
                      children: [
                   TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (txt) {
                              var nonNullValue=txt??'';
                            if(nonNullValue.isEmpty){
                              return "Enter Email";

                            }
                             else if(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(nonNullValue)){
                             
                             return null;
                              }
                              else {
                                return "Enter valid email";
                               
                              }
                             },
                         
                             

                          
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
                       TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          controller: password,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              validator: (txt) {
                               
                                if (txt == null || txt.isEmpty) {
                                  return "Required Password";
                                }
                                if (txt.length < 8) {
                                  return "Password must has 8 characters";
                                }
                                if (!txt.contains(RegExp(r'[A-Z]'))) {
                                  return "Password must has uppercase";
                                }
                                if (!txt.contains(RegExp(r'[0-9]'))) {
                                  return "Password must has digits";
                                }
                                if (!txt.contains(RegExp(r'[a-z]'))) {
                                  return "Password must has lowercase";
                                }
                                if (!txt.contains(RegExp(r'[#?!@$%^&*-]'))) {
                                  return "Password must has special characters";
                                } else
                                  return null;
                              },
                          
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
                            backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20,20,20,20),
                            
                             
                          ),
                          onPressed: () {
                           if( _erkey.currentState!.validate()){
                              setState(() { 
                                em=email.text;
                                pas=password.text;
                              });
                            
                           loginstate();
                           }
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

