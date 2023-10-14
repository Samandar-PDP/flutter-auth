import 'dart:io';

import 'package:firebase_l1/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = Auth();

  _loading() {
    return Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              Image.network(
                  'https://cdni.iconscout.com/illustration/premium/thumb/login-page-4468581-3783954.png'),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 20),
              SizedBox(
               height: 55,
               child: _auth.isLoading ?
                 _loading() :  ElevatedButton(
                   onPressed: () async {
                    final response = await _auth.register(
                         email: _emailController.text,
                         password: _passwordController.text);
                    debugPrint(response);
                   },
                   child: const Text("Login")),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
