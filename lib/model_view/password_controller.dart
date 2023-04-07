import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scores/models/patient/forgotpassword_model.dart';

import '../models/patient/register_model.dart';
import '../view/Home_Screen.dart';

void forgotpassword() async {
  var headers = {'Content-Type': 'application/json'};
  try {
    var URLS ='http://10.0.2.2:3005';
    var url=Uri.parse('${URLS}/patient/forgot-password');
    var email;

    ForgotPasswordModel body = ForgotPasswordModel(
      email: email,
    );

    http.Response response =
    await http.post(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['code'] == 0) {
        var token = json['data']['Token'];
        print(token);
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