import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

import '../../model_view/auth_viewmodel.dart';
import 'custom_text.dart';

class CustomTextFromFieldemail extends GetWidget<AuthViewModel>{

  TextEditingController _mycontroller = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        autovalidateMode: AutovalidateMode.always,

        key: formstate,
        child: Column(
          children: [
            CostumText(text :"Email",fontSize:14, color: Colors.grey.shade900),

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
              validator: (text){
                if (text == '' ) {return 'ERROR => Vide';}
              },

              onSaved: (text){

              },
              controller: _mycontroller,
              decoration: InputDecoration(
                hintText: "MEDINOUTLOOK@gmail.com",
                hintStyle: TextStyle(color: Colors.grey,),
                fillColor: Colors.white,
              ),
            ),



          ],

        ));


  }





}


