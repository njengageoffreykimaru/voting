import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:onlinevoting/Login.dart';
import 'package:onlinevoting/Signup.dart';




Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey:  "AIzaSyBVfKXO7uVmCRmPpVo-fEinbyBFKpbtYLc",
        appId: "1:522632664185:web:795fa5606e9f273e00f0a8", messagingSenderId: "522632664185",
        projectId: "onlinevoters-1e0cb"));
  }
  await Firebase.initializeApp(); runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login and Register',
      initialRoute: '/register',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Signup(),
      },
    );
  }
}

