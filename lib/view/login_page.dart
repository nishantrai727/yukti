// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(18, 17, 16, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please sign in to your account",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 280,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      // onChanged: ((value) => {print(value)}),
                      validator: (value) {
                        if (value != null || value!.isEmpty) {
                          return "Enter valid email address!";
                        }
                        if (value.contains("@")) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Email/Phone number",
                          hintStyle: TextStyle(color: Colors.grey),
                          // fillColor: Colors.grey,
                          filled: true),
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 280,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        print(value);
                        if (value != null || value!.isEmpty) {
                          return ("Enter Valid Password");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onSaved: (value) {
                        print(value.toString());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // print(_passwordController.text);

                      final response = await authController.login(
                          _emailController.text, _passwordController.text);
                      // print(response);
                      if (response) {
                        Get.offAllNamed("home_page");
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/signup_page");
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
