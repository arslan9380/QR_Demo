import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qr_bar_code_flutter/widgets/input_field.dart';

import 'controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: authController.isLoading.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: Get.width * 0.3,
                            child: Image.asset("assets/logo.png")),
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      InputField(
                        hint: "Email",
                        controller: emailCon,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      InputField(
                        hint: "Password",
                        controller: passwordCon,
                        obscure: true,
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      GestureDetector(
                        onTap: () => authController.login(
                            emailCon.text.trim(), passwordCon.text.trim()),
                        child: Container(
                          height: 55,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color(0xff00205b),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: // Adobe XD layer: 'johndoe@mail.com' (text)
                                Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 21,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
