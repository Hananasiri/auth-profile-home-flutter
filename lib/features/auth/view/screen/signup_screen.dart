import 'package:auth_profile_home_flutter/core/constants/validation.dart';
import 'package:auth_profile_home_flutter/features/auth/logic/controller/auth_controller.dart';
import 'package:auth_profile_home_flutter/features/auth/model/auth_model.dart';
import 'package:auth_profile_home_flutter/features/auth/view/widget/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../core/routes/route.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'SignUp'.tr,
        style: TextStyle(color: Colors.blue),
      )),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 390,
                  height: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Text('CreateAccount'.tr,
                          style: TextStyle(color: Colors.blue, fontSize: 22)),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: authController.emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Please enter email".tr;
                          } else if (!RegExp(Validation.validationEmail)
                              .hasMatch(value)) {
                            return "Please enter a correct email address".tr;
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(Icons.email),
                        label: 'E-mail'.tr,
                      ),
                      TextFieldWidget(
                        controller: authController.nameController,
                        maxLine: 1,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter your FullName';
                          } else if (!RegExp(Validation.validationName)
                              .hasMatch(value)) {
                            return "Please enter a correct Name";
                          } else if (value.toString().length < 2) {
                            return 'Your Name should be at least 2 long ';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(Icons.person),
                        label: 'Full Name'.tr,
                      ),
                      GetBuilder<AuthController>(builder: (authController) {
                        return Column(
                          children: [
                            TextFieldWidget(
                              controller: authController.phoneController,
                              maxLine: 1,
                              obscureText: false,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your phone number".tr;
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                              label: 'PhoneNumber'.tr,
                            ),
                            const SizedBox(height: 10),
                            TextFieldWidget(
                              label: 'Birth Day'.tr,
                              controller: authController.dateController,
                              obscureText: false,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Please enter Date'.tr;
                                } else {
                                  return null;
                                }
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  authController.chooseDate();
                                },
                                icon: authController.isDate
                                    ? SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: Icon(Icons.calendar_month),
                                      )
                                    // color: labalColor, size: 20)
                                    : SizedBox(
                                        height: 25,
                                        width: 25,
                                        child:
                                            Icon(Icons.calendar_month_outlined),
                                      ),
                                iconSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      }),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Get.offNamed(Routes.homeScreen);
                            //add func
                            var data = AuthModel(
                              email: authController.emailController.text,
                              name: authController.nameController.text,
                              phoneNum: authController.phoneController.hashCode,
                              birthDate: authController.dateController.hashCode,
                              id: 'id',
                            );
                            await authController.signUpWithEmail(data);
                            //authController.refreshData();
                            // authController.clearController();
                          }
                        },
                        child: Text('SignUp'.tr),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
