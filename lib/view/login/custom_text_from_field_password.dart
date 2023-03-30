import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model_view/auth_viewmodel.dart';
import 'custom_text.dart';

class CustomTextFromFieldpassword extends GetWidget<AuthViewModel>{
   final String text;
   final String hint;
  TextEditingController _mycontroller = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();






  CustomTextFromFieldpassword( {
    this.text = '',
    this.hint = '',

  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
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
              validator: (text){
                if (text == '' ) {return 'ERROR => Vide';}
              },

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