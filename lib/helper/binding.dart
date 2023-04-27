
import 'package:get/get.dart';

import '../model_view/auth_viewmodel.dart';



class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());


  }

}