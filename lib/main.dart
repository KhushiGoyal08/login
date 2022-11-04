import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:loginapp/initial.dart';
import 'package:loginapp/last.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/sign_up.dart';
import 'package:loginapp/forgot.dart';
import 'package:loginapp/last.dart';
import 'package:loginapp/verify.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(

  options: DefaultFirebaseOptions.currentPlatform,
 );

 
  runApp(
    
    NewWidget(),
  );
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  late StreamSubscription<User?>user;
  void initState(){
    super.initState();
    user=FirebaseAuth.instance.authStateChanges().listen((user) { 
      
  if(user!=null){
    print('User is Currently Signed out');
  }else{
    print('User is signed in');
  }

    });
  }
  @override
  void dispose(){
    user.cancel();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   
    initialRoute: FirebaseAuth.instance.currentUser==null? 'initial': 'last',
     routes: {
        'initial': (context) => const First_route(),
        'login': ((context) => const MyLogin()),
        'sign_up': ((context) => const account()),
        'forgot': ((context) => const forgot()),
        'last': ((context) => const aflo()),
        'verify':(context) => const verify(),
      },
    );
  }
  
}
 

