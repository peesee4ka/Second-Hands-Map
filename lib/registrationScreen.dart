import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_13_04_2026_1/homeScreen.dart';

class RegistrationScreen extends StatefulWidget{
  const RegistrationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}
class _LoginScreenState extends State<RegistrationScreen>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
      Navigator.pop(context);
    }
    on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left_sharp)),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: (){login();},
              child: Text("Create account"),
            )
          ],
        ),
      ),
    );
  }

}