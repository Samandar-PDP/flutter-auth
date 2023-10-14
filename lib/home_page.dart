import 'package:firebase_l1/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${_auth.getUser()?.uid}\n${_auth.getUser()?.email}",style: TextStyle(fontSize: 30),),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _auth.logOut();
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.exit_to_app),
                label: Text("Log out"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
