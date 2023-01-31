// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class StackWidget extends StatelessWidget {
  // const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage("assets/images/variant2.png")),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    // padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/cam_icon.png"))),
                  ),
                  Container(
                    height: 220,
                    width: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/cine_compass.png"))),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Text("YOU ARE ONE STOP SOLUTION TO",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rent Pre-Production Equipments Easily",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed("login_page");
                        },
                        child: Text("Get Started"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(200, 50),
                        ))
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // )
            ],
          ),
        ],
      ),
    );
  }
}
