import 'dart:ffi';
import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinevoting/utils.dart';



class Add_candindate extends StatefulWidget {
  @override
  State<Add_candindate> createState() => _Add_candindateState();
}

class _Add_candindateState extends State<Add_candindate> {
  Uint8List ? _image;






  final TextEditingController _candidatenameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _politicalAffiliationController=TextEditingController();
  final TextEditingController _partyController= TextEditingController();
  final TextEditingController _manifestoController=TextEditingController();
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
              Stack(

                children: [
                  _image !=null ?
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage( _image!),



                  ): const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://www.google.com/imgres?imgurl='
                        'https%3A%2F%2Fe7.pngegg.com%2Fpngimages%2F647%2F460%'
                        '2Fpng-clipart-computer-icons-open-person-family-icon-black-silhouette-black.png&tbnid=whEcd1rQN46yOM&vet=12ahUKEwjy7vK6nf2BAxV1YKQEHdONADIQMygCegQIARBQ..i&imgrefurl=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Dperson%2BIcon&docid=6QXzO8Uv4cU_1M&w=900&h=512&q=person%20icon%20png%'
                        '20black&ved=2ahUKEwjy7vK6nf2BAxV1YKQEHdONADIQMygCegQIARBQ'),


                  ),

                  Positioned(child: IconButton(onPressed: (){


                  }, icon: Icon(Icons.camera_enhance_rounded)
                  ),
                    bottom: -10,
                    left: 80,

                  ),

                ],
              ),
              SizedBox(height: 20,),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid name";
                  }
                  return null;
                },
                controller: _candidatenameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                  labelText: "CandidateName",
                ),


              ),

              SizedBox(height: 10,),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter valid name";
                }
                return null;
              },
              controller: _politicalAffiliationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                labelText: "Political Affiliation",
              ),


            ),

            SizedBox(height: 10,),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid name";
                  }
                  return null;
                },
                controller: _positionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                  labelText: "Position",
                ),


              ),
              SizedBox(height: 8,),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid name";
                  }
                  return null;
                },
                controller: _partyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                  labelText: "Party",
                ),


              ),

              SizedBox(height: 10,),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter valid name";
                  }
                  return null;
                },
                controller: _manifestoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_sharp,color: Colors.black,),
                  labelText: "manifesto",
                ),


              ),






              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                ),
                onPressed: () {
                  CollectionReference collRef=FirebaseFirestore.instance.collection('candidate');
                  collRef.add({
                    'candidatename':_candidatenameController.text,
                    'position':_positionController.text,
                    'politicalAffiliation': _politicalAffiliationController.text,
                    'party':_partyController.text,
                    'manifesto': _manifestoController.text,



                  }


                  );

                },

                child: Text('Register'),
              ),

            ],
          ),
        ),
      ),
    );
  }




}
