import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirebase5/screen/homepage.dart';
import 'package:myfirebase5/screen/loginscreen.dart';

class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.pink),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: const Text('Something Went Wrong'),
                );
              } else if (snapshot.hasData) {
                return const MyHomePage();
              } else {
                return const LoginScreen();
              }
            })),
      );
}
