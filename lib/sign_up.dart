// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:loginapp/verify.dart';

import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';



class account extends StatefulWidget {
  const account({super.key});
  
  @override
  State<account> createState() => _accountState();
}

// ignore: camel_case_types
class _accountState extends State<account> {
  final  _formkey = GlobalKey<FormState>();

  var emaily ="";
  var passwordy ="";
  var con ="";
  var user ="";


  final password = TextEditingController();
  final username = TextEditingController();
  final confirm = TextEditingController();
   final email = TextEditingController();
   final _auth= FirebaseAuth.instance;

@override
 void dispose(){
  //clean the controller when the widget is disposed
  email.dispose();
  password.dispose();
  confirm.dispose();
  username.dispose();
  super.dispose();
 }
  registration() async{ 
         if(passwordy==con)
          {
          try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emaily, password: passwordy);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Registeration Successfull,Please Log in",
                    style:  TextStyle(fontSize: 20.0),
          ),
          ),

        );
        Navigator.pushReplacement(context , MaterialPageRoute(builder: ((context) => const verify()),),);
      }
      on FirebaseAuthException catch(e){
         if(e.code == 'email-already-in-use'){
           ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Account Already Exists",
                    style:  TextStyle(fontSize: 18.0,
                    color: Colors.black,
                    ),
          ),
          ),

        );

        }
      } 
    }  else{
      
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Password and Confirm Password doesn't match",
                    style:  TextStyle(fontSize: 16.0,
                   color: Colors.black,
                   ),
          ),
          ),

        );
      } 
  }

 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors

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
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Sign Up',
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
                  child: Form(
                    key: _formkey,
                    child: Center(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: username,
                            validator: (txt) {
                              var nonNullValue = txt ?? '';
                              if (nonNullValue.isEmpty ) {
                                return ("Username is required");
                              } else
                                return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 102, 171, 192),
                              filled: true,
                              hintText: 'Username',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          TextFormField(
                            controller: email,
                            validator: ((txt) {
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
                            height: 20,
                          ),

                          TextFormField(
                              obscureText: true,
                              controller: password,
                              // errorText
                              autovalidateMode: AutovalidateMode.onUserInteraction,

                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(255, 102, 171, 192),
                                  filled: true,
                                  hintText: 'Set Password',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (txt) {
                               
                                if (txt == null || txt.isEmpty) {
                                  return "Password Required";
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
                              }
                              ),

                            
                          
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: confirm,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator:((txt) {
                               if (txt == null || txt.isEmpty) {
                                  return "Password Required";
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
                              
                              
                            }),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 102, 171, 192),
                                filled: true,
                                hintText: 'Confirm Password',
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),

                          const SizedBox(
                            height: 50,
                          ),

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            ),

                            onPressed: () {
                           if(_formkey.currentState!.validate()){
                            setState(() {
                              emaily =email.text;
                              passwordy = password.text;
                              user= username.text;
                              con= confirm.text;
                            });
                          
                            registration();        
                                  
                           }
                            
                         }, 
                          

                            // ignore: prefer_const_constructors
                            child: const Text(
                              'NEXT  -->',
                              style: TextStyle(
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

 
  
