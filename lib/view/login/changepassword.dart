
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:scores/view/login/Custombuttonpass.dart';
import 'package:scores/view/login/custom_text_from_field_changepassword.dart';
import 'package:scores/view/login/custombutton1.dart';

import '../../model_view/auth_viewmodel.dart';
import 'custom_text.dart';
import 'custom_text_from_field_email.dart';
import 'custom_text_from_field_password.dart';
import 'custombutton.dart';
import 'custombutton2.dart';
import 'custombutton3.dart';


class ChangePassword extends GetWidget<AuthViewModel>
{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade500,
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          child:Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CostumText(text :"Welcome",fontSize:30,color: Colors.black,fontw: FontWeight.w800),
                    CostumText(text :"Sign Up",fontSize:18, color: Colors.blue,fontw: FontWeight.w700,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                CostumText(text :"Sign In to continue",fontSize:14, color: Colors.grey),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomTextFromFieldemail( ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFromFieldpassword(onvalidate: (text){
                      if (text == '' ) {return 'ERROR => Vide';}
                    },
                      text:"NewPassWord", hint:"********" ,),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFromFieldChangepassword(onvalidate:(text){
                      if ((text != '' ) && (text == controller.password))
                      {controller.valid=true;}
                    },
                      text:"ConfirmPassWord", hint:"********" ,),
                    SizedBox(
                      height: 10,
                    ),
                    CostumText(text: "Forgot PassWord",fontSize: 14,color: Colors.grey.shade700,alignment: Alignment.topRight,),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButtonPass(onPressed: ()async {

                      print(controller.email);
                      print(controller.password);
                      print(controller.valid);
                      if (controller.valid==true){
                      controller.loginWithEmail();}

                    },
                      text:'SIGN IN', fw:FontWeight.w800, color:Colors.red.shade600,left: 80,right: 30,pic: "lib/Images/0.png",
                    ),












                  ],
                ),

              ],
            ),
          ),
        ),

      ),

    );
  }

}