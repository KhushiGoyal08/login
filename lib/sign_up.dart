import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/sign_up.dart';


class account extends StatefulWidget {
  const account({super.key});
  
  @override
  State<account> createState() => _accountState();
}

// ignore: camel_case_types
class _accountState extends State<account> {
  final GlobalKey<_accountState> _formkey = GlobalKey<_accountState>();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
   TextEditingController email = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    username.addListener(() {
      final String text = username.text.toLowerCase();
    
    });
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
                        
                              if(txt!.isEmpty||RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(txt)){
                            return "Enter correct email";
                              }
                              else {
                                return null;
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
                                  return "Invalid password!";
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phone,
                            validator:((txt) {
                              if(txt!.isEmpty || RegExp(r'^[+]*[()]{0,1}[0-9]{1-4}+$').hasMatch(txt)){
                                return"Enter Correct phone number";
                              }
                              else{
                                return null;
                              }
                              
                            }),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 102, 171, 192),
                                filled: true,
                                hintText: 'Phone Number',
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
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            ),

                            onPressed: () {
                            if( _formkey.currentState!.validate()){
                             
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyLogin(),
                                ),
                             );
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
  
 validate() {
     validator: (txt) {
                               
                                if (txt == null || txt.isEmpty) {
                                  return "Invalid password!";
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
                              };
  }
}
