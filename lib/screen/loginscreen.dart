import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirebase5/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _gmail = TextEditingController();
final _password = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              label: Text('Gmail'),
            ),
            controller: _gmail,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              label: Text('Password'),
            ),
            controller: _password,
          ),
          CupertinoButton(
              child: const Text('Login'),
              onPressed: () {
                signIn();
              }),
        ]),
      ),
    );
  }

  Future signIn() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(
    //           child: CircularProgressIndicator(color: Colors.pink),
    //         ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _gmail.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
