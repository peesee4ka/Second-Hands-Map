import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_13_04_2026_1/loginScreen.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: TextButton(onPressed: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
              child: Text("login",
              style: TextStyle(fontSize: 30),)),)
        ],
      ),
    );
  }
}