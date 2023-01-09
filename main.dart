import 'package:flutter/material.dart';
import 'package:viva_app/Auth Pages/sign up.dart';
import 'package:viva_app/Pages/VivaMarkPage1.dart';
import 'package:viva_app/Pages/drawer.dart';
import 'package:viva_app/Pages/home.dart';
import 'package:viva_app/Auth Pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viva_app/Welcome%20Pages/Welcome.dart';
import 'package:viva_app/Pages/editProfile.dart';
import 'firebase_options.dart';
import 'package:viva_app/Pages/projects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva_app/Pages/Table.dart';
bool isLoggedin=true;
main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  User? user=FirebaseAuth.instance.currentUser;
  if(user==null){
    isLoggedin=false;
  }
  else{
    isLoggedin;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _vivaApp = Firebase.initializeApp();
  @override

  Widget build(BuildContext context) {
    MainPage(){
      if(isLoggedin==false){
        return Welcome();
      }
      else{
        return Home();
      }
    }
    return MaterialApp(

      title: 'Second App',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        'login':(context) => Login(),
        'home':(context) => Home(),
        'sign up':(context)=> Signup(),
        'projects':(context)=> ProjectsPage(),
        //'table':(context)=>TablePage(),
        'vivaMarkPage':(context)=>VivaMarkPage1()
      },

    );
  }
}