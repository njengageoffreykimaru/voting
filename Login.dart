import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Add_candidate.dart';
import 'vote_page.dart';
import'dart:ffi';
import 'Homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:

      Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(
                      r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
                      .hasMatch(value)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                ),
                onPressed: () {
                  Signin(_emailController.text, _passwordController.text);
                },
                child: Text('Login'),
              ),

            ],
          ),

        ),

      ),
    );

  }
  void Signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Fluttertoast.showToast(
          msg: "Login success.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Add_candindate(),
        ));
      } catch (e) {
        Fluttertoast.showToast(
          msg: "Login failed. Please check your email and password.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  }
