import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/dialog_widget.dart';
import '../../logic/controller/profile_controller.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key, required this.profileController})
      : super(key: key);
  final ProfileController profileController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return DialogWidget(
      title: 'pleaseConfirm'.tr,
      content: "AreYouSureToLogOut".tr,
      textButton: 'log out'.tr,
      onPressed: () {
       // profileController.signOut();
      },
      child: Row(
        children: [
          Text(
            "log out".tr,
            style: theme.headlineMedium,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
