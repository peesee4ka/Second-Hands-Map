import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_13_04_2026_1/loginScreen.dart';
import 'registrationScreen.dart';

class ProfileScreen extends StatelessWidget{
  Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(onPressed: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text("Sign in",
            style: TextStyle(fontSize: 30),)),
            TextButton(onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegistrationScreen()));
            },
                child: Text("Sing up",
                  style: TextStyle(fontSize: 30),)),
            TextButton(onPressed: (){logOut();},
                child: Text("Sign out",
                  style: TextStyle(fontSize: 30),)),
          ]
    )
        )
    );

  }
}