import 'dart:io';

import 'package:firebase_l1/auth.dart';
import 'package:firebase_l1/home_page.dart';
import 'package:firebase_l1/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = Auth();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    print(_auth.getUser());
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
               child: _isLoading ?
                 loading() :  ElevatedButton(
                   onPressed: () async {
                     setState(() {
                       _isLoading = true;
                     });
                    final response = await _auth.login(
                         email: _emailController.text,
                         password: _passwordController.text);
                    await Future.delayed(const Duration(seconds: 1));
                     setState(() {
                       _isLoading = false;
                     });
                     if(response == "Success") {
                       _navigate();
                     }
                    debugPrint(response);
                   },
                   child: const Text("Login")),
             ),
              const SizedBox(height: 20),
              TextButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
              }, child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
  _navigate() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
  }
}
