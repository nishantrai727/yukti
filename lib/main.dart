// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './view/startup_page.dart';
import './view/login_page.dart';
import './view/signup_page.dart';
import './view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yukti",
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: (() => MyApp()),
        ),
        GetPage(
          name: "/login_page",
          page: (() => LoginPage()),
        ),
        GetPage(
          name: "/signup_page",
          page: (() => SignUpPage()),
        ),
        GetPage(
          name: "/home_page",
          page: (() => HomePage()),
        )
      ],
      home: Scaffold(
        body: StackWidget(),
      ),
    );
  }
}
