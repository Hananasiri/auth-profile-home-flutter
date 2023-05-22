import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/header_widget.dart';
import '../../../../core/routes/route.dart';
import '../../logic/controller/profile_controller.dart';
import '../widget/personal_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
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
                  profileController: profileController,
                )),
          ]),
        ),
      );
    });
  }
}
