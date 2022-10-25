 import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/sign_up.dart';

class First_route extends StatefulWidget {
  const First_route({super.key});

  @override
  State<First_route> createState() => _First_routeState();
}

class _First_routeState extends State<First_route> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.lightBlue[900],
    body: Column(
      
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget> [
          const Padding(
            padding: EdgeInsets.only(
              top: 200,
              right: 20,
            ),
            ),

           const Text('Hey There,',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          )
    ),
    const Text('Let\'s Begin Our  Journey',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          ),
    ),
    const SizedBox(
                          height: 60,
                        ),
                        
    
     ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20,20,20,20),
                            
                             
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                             builder: (context) => const MyLogin(),
                            ),
                            );
                          },
                          // ignore: prefer_const_constructors
                          child: Text('Login',
                          style : const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,


                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                         ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.fromLTRB(20,20,20,20),
                            
                             
                          ),
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(
                             builder: (context) => const account(),
                            ),
                            );
                          },
                          // ignore: prefer_const_constructors
                          child: Text('Sign  Up',
                          style : const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,


                          ),
                          ),
                        ),
        ],
    ),
    // ignore: prefer_const_constructors
    
     
    );
  }
}
