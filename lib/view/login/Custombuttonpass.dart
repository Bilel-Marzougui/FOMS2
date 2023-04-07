
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:scores/model_view/login_controller.dart';

import 'package:http/http.dart' as http;
import 'package:scores/models/patient/login_model.dart';
import 'dart:convert';

import '../../model_view/auth_viewmodel.dart';
import '../../models/patient/register_model.dart';


class CustomButtonPass extends GetWidget<AuthViewModel>{


  final String text;
  final FontWeight fw;
  final Color color;
  final Color textcolor;
  final double left;
  final double right;
  final double between;
  final String pic;
  final VoidCallback onPressed;



  CustomButtonPass({required this.onPressed,this.text='', this.fw=FontWeight.w500, this.color=Colors.white, this.textcolor=Colors.white, this.left = 140, this.right = 140, this.between=50, this.pic="lib/Images/0.png"});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(child: ElevatedButton(


      onPressed: onPressed,

      child: Row(
        children: [ Image(image:AssetImage(pic,) ,height: 50,width: 40,),
          SizedBox(width: between,),
          Text(text,style: TextStyle(fontWeight: fw,color: textcolor),),],),

      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.only(left: left,right: right),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),


        ),

      ),

    ),

    );


  }




}