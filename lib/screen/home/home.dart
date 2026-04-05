import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //reference for the authentication service
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:bgBlack,
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(bgBlack),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              child: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text("HOME",
                    style: TextStyle(
                        color: Colors.white, 
                        fontSize: 30, 
                        fontWeight: FontWeight.w800,
                        ),
                ),
                const SizedBox(height: 20),


                Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                        color: textLight, 
                        fontSize: 10, 
                        fontWeight: FontWeight.w200,
                        ),),
                Center(
                          child: Image.asset(
                            'assets/images/man.png',
                            height: 60,
                          ),
                        ),
              ],
            ),
          ),
        ),
       
      ),
    );
  }
}
