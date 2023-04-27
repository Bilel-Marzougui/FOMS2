
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scores/view/login/changepassword.dart';
import 'package:scores/view/login/login_screen.dart';

import 'helper/binding.dart';
import 'package:mongo_dart/mongo_dart.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding (),

      home: Scaffold(
        body: LoginScreen(),






      ),

    );
  }
}
