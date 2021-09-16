import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:qr_bar_code_flutter/helpers/auth_helpers.dart';
import 'package:qr_bar_code_flutter/models/user_model.dart';

import '../home_view.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  AuthHelpers authHelpers = AuthHelpers();
  var userModel = UserModel().obs;

  getCurrentUserData() async {
    isLoading.value = true;
    userModel.value = await authHelpers.getCurrentUserData();
    isLoading.value = false;
  }

  login(String email, String password) async {
    isLoading.value = true;
    String response = await authHelpers.login(email, password);
    if (response != null) {
      Get.snackbar(response, '');
      isLoading.value = false;
    } else {
      Get.offAll(HomeView());
      isLoading.value = false;
    }
  }

  signUp(UserModel userModel, String password) async {
    isLoading.value = true;
    String response = await authHelpers.signUp(userModel, password);
    if (response != null) {
      Get.snackbar(response, '');
      isLoading.value = false;
      return false;
    } else {
      isLoading.value = false;
      return true;
    }
  }
}
