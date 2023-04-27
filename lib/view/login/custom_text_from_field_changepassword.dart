import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../model_view/auth_viewmodel.dart';
import '../../model_view/login_controller.dart';
import 'custom_text.dart';
import 'custom_text_from_field_password.dart';

class CustomTextFromFieldChangepassword extends GetWidget<AuthViewModel>{
  final String text;
  final String hint;
  final FormFieldValidator onvalidate;

  TextEditingController _mycontroller = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();






  CustomTextFromFieldChangepassword( {required this.onvalidate,
    this.text = '',
    this.hint = '',



  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        autovalidateMode: AutovalidateMode.always,
        key:formstate,
        child: Column(
          children: [
            CostumText(text :text,fontSize:14, color: Colors.grey.shade900),
            TextFormField(
              onEditingComplete: (){
                var formdata = formstate.currentState;
                if (formdata!.validate()){
                  formdata.save();

                }else  print('Error => Vide');

              },
              onChanged: (text){
                print("$text");

              },
              validator: onvalidate,

              onSaved: (text){

              },
              controller: _mycontroller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey,),
                fillColor: Colors.white,
              ),
            ),
          ],
        ));


  }




}