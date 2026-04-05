import 'package:firebase_auth_app/screen/authentication/login.dart';
import 'package:firebase_auth_app/screen/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signinPage = true;

  //toggle between login and register page
  void switchPage(){
    setState(() =>
     signinPage = !signinPage
     );
  }
  @override
  Widget build(BuildContext context) {
    if(signinPage == true){
      return Login(toggle: switchPage);
    } else {
      return Register(toggle: switchPage);
    }
  }
}
