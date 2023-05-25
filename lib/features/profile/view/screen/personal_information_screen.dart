import 'package:auth_profile_home_flutter/features/auth/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/header_widget.dart';
import '../../../../core/routes/route.dart';
import '../widget/personal_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            HeaderWidget(
              onPressed: () {
                Get.offNamed(Routes.profileScreen);
              },
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 390,
                height: 450,
                child: PersonalInformationWidget(
                  authController: authController,
                )),
          ]),
        ),
      );
    });
  }
}
