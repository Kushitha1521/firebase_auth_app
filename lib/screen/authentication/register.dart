import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  //form key for the form
  final _formKey = GlobalKey<FormState>();

  //email and password state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: Text('Register', style: TopicStyle),
        backgroundColor: bgBlack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              Text(description, style: descriptionStyle),
              Center(child: Image.asset('assets/images/man.png', height: 200)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      //emial
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: textStyleInputDecoration,
                        validator: (val) =>
                            val!.isEmpty == true ? 'Enter an email' : null,
                        onChanged: (val) => setState(() => email = val),
                      ),
                
                      const SizedBox(height: 20),
                
                      //password
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: textStyleInputDecoration.copyWith(
                          hintText: "Password",
                        ),
                        validator: (val) => val!.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) => setState(() => password = val),
                      ),
                
                      const SizedBox(height: 20),

                      Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),
                
                      //google sign in
                      Text("Login with google", style: descriptionStyle),
                
                      const SizedBox(height: 10),
                
                      GestureDetector(
                        onTap: () {
                          // Handle Google sign-in logic here
                        },
                
                        child: Center(
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 60,
                          ),
                        ),
                      ),
                
                      const SizedBox(height: 20),
                
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(width: 5),
                
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                              //navigate to login page
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: mainBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 20),
                
                      //register User
                      GestureDetector(
                        onTap: () async{
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if(result == null){
                            setState(() {
                              error = "Please supply a valid email";
                            });
                            print("error signing in");
                          } else {
                            print("signed in");
                            print(result.uid);
                          }
                          //validate the form
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: mainYellow, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
