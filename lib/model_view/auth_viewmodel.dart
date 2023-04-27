
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scores/models/patient/register_model.dart';

import '../models/patient/forgotpassword_model.dart';
import '../models/patient/login_model.dart';
import '../view/Home_Screen.dart';


class AuthViewModel extends GetxController {
  bool valid=false;

  String email = '',
      password = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var URLS ='http://10.0.2.2:3005';
      var url=Uri.parse('${URLS}/patient/login');

      LoginRequestModel body = LoginRequestModel(
        email: email,
        password: password,
      );
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      debugPrint(jsonEncode(body));

      debugPrint(response.body.toString());
      if (response.statusCode == 200) {

        Get.off(HomeScreen());
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }


  void registerWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var URLS ='http://10.0.2.2:3005';
      var url=Uri.parse('${URLS}/patient');
      RegisterRequestModel body = RegisterRequestModel(
        email: email,
        password: password,
      );

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);

          Get.off(HomeScreen());
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Error! Invalid Email OR Email Already exist";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }









  void forgotpassword() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var URLS ='http://10.0.2.2:3005';
      var url=Uri.parse('${URLS}/patient/forgot-password');


      ForgotPasswordModel body = ForgotPasswordModel(
        email: email,
      );

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {

        Get.off(HomeScreen());
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }



}