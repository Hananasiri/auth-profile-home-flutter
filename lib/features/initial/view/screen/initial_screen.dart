import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/route.dart';
import '../../controller/initial_controller.dart';
import '../widget/localization_widget.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);
  final initialController = Get.find<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LocalizationWidget(),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.signScreen);
                    Colors.black26;
                  },
                  child: Text(
                    'SignUp Screen'.tr,
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.profileScreen);
                  },
                  child: Text(
                    'Profile Screen'.tr,
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.homeScreen);
                  },
                  child: Text(
                    'Home Screen'.tr,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
