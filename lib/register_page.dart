import 'package:flutter/material.dart';

import 'auth.dart';
import 'home_page.dart';
import 'loading.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = Auth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
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
                loading() : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final response = await _auth.register(
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
