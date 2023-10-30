import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Login.dart';
import'user_model.dart';


class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();
  final _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid name";
                  }
                  return null;
                },
                  controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                  labelText: "Name",
                ),


              ),
              SizedBox(height: 20,),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid phone number";
                  }
                  return null;
                },
                controller: _mobileController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call,color: Colors.black,),
                  labelText: "Phone",
                ),


              ),
              SizedBox(height: 10,),

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
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 10,),
              // TextFormField(
              //   controller: _confirmPasswordController,
              //   obscureText: true,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "confirm password is required";
              //     } else if (_passwordController != _confirmPasswordController) {
              //       return "passwords should match";
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.lock, color: Colors.black),
              //     labelText: 'Confirmpassword',
              //   ),
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Register(
                      _nameController.text,
                      _mobileController.text,
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
                child: Text('Register'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void Register(String username, String phone, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        postDetailsToFirestore(userCredential);
      } catch (e) {
        Fluttertoast.showToast(
          msg: e.toString(),
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
  void postDetailsToFirestore(UserCredential userCredential) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = userCredential.user;
    User_Model user_model = User_Model();
    user_model.email = user!.email;
    user_model.password = user.uid;
    user_model.username = _nameController.text;
    user_model.phone=_mobileController.text;
    await firebaseFirestore.collection("voters").doc(user.uid).set(user_model.toMap());

    Fluttertoast.showToast(
      msg: "Account created successfully.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
          (route) => false,
    );
  }

}
