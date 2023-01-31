import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../model/http_exception.dart';

class AuthController extends GetxController {
  Future<bool> login(String email, String password) async {
    final url =
        "https://cinecompass.yuktidea.com/api/v1/login?login=${email}&password=${password}";
    final parsedUrl = Uri.parse(url);

    try {
      final response = await http.post(
        parsedUrl,
        // body: json.encode({"login": email, "password": password}),
      );

      // print(response.body);

      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData["status"] == false) {
        print("false");
        throw HttpException(responseData["message"]);
        return false;
      }
      print("true");
      return true;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> signup(
    String name,
    String email,
    String phoneNumber,
    String password,
    String confirmPass,
  ) async {
    final url =
        "https://cinecompass.yuktidea.com/api/v1/register?name=${name}&email=${email}&phone=${phoneNumber}&password=${password}&password_confirmation=${confirmPass}";

    final parsedUrl = Uri.parse(url);

    try {
      final response = await http.post(parsedUrl);

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData["status"] == false) {
        print("false");
        throw HttpException(responseData["message"]);
        return false;
      }

      print("true");
      return true;
    } catch (error) {
      throw (error);
    }
  }
}
