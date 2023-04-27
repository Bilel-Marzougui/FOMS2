import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CostumText extends StatelessWidget{



  final String text ;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontw;

  CostumText({
    this.text ='' ,
    this.fontSize = 16 ,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontw =FontWeight.w500,

  });

  @override

  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      alignment: alignment,
      child: Text(text  , style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontw,

      )
      ),

    );
  }


}