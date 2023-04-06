import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Image.asset('assets/login.png'),
              ),
              Text(
                "Welcome back!",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                child: Text(
                  "You've been missed",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: (){
                  _controller.googleSignIn();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Container(
                    color: Colors.grey[200],
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/google-logo.png'),
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                child: Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("Or"),
                  Expanded(child: Divider()),
                ]),
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email"

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                child: TextField(
                  obscureText: true,
                  
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility_outlined),
                    border: OutlineInputBorder(),
                    hintText: "Enter password"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){},
                  child: Text("Sign In",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    "Don't have an Account?  ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  Text(
                    "Sign up here",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
