import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../view/Home_Screen.dart';

class LoginController extends GetxController {
  @override

  String email='azerty';
  String password='azerty';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var URLS ='http://10.0.2.2:3005';
      var url=Uri.parse('${URLS}/patient/login');
      Map body = {
        'email': email,
        'password': password
      };
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

}
