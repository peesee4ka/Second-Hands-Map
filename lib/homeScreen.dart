import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  final User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    String name = user?.email ?? "Guest";
      return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Text("Hello $name")
              ],
            )
        )
      );
    }
}