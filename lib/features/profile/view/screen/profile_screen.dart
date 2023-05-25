import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/route.dart';
import '../../../initial/view/widget/darkmode_widget.dart';
import '../../../initial/view/widget/localization_widget.dart';
import '../../logic/controller/profile_controller.dart';
import '../widget/logout_widget.dart';
import '../widget/profile_header.dart';
import '../widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(
          actions: const [
            DarkModeWidget(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 390,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const ProfileHeaderWidget(),
                  const SizedBox(height: 60),
                  ProfileWidget(
                    text: 'personalInformation'.tr,
                    onTap: () {
                      Get.offNamed(Routes.personalInformation);
                    },
                  ),
                  const LocalizationWidget(),
                  LogOutWidget(
                    profileController: profileController,
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
