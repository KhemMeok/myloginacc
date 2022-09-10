import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('Signed In As',style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 5,),
            Text(user.email!,style: const TextStyle(fontSize: 20),),
            TextButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            }, child: const Text('LogOut'),),
          ]),
        ),
      ),
    );
  }
}
