import 'package:auth_profile_home_flutter/features/auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/logic/controller/auth_controller.dart';
import '../../../auth/view/widget/TextFieldWidget.dart';
import '../../logic/controller/profile_controller.dart';
import '../../model/profile_model.dart';

class PersonalInformationWidget extends StatelessWidget {
   PersonalInformationWidget({Key? key, required this.profileController, this.profileModel
   }): super(key: key);

  final  ProfileController profileController;
  //final authController = Get.put(AuthController());
   final controller = Get.find<ProfileController>();

   final ProfileModel? profileModel;

  @override
  Widget build(BuildContext context) {

    // controller.nameController.text = profileModel!.name;
    // controller.emailController.text = profileModel!.email;
    // controller.phoneController.text = profileModel!.phoneNum as String;


    final theme = Theme.of(context).textTheme;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
              'personalInformation'.tr,
            style: TextStyle(color: Colors.blue , fontSize: 22)
          ),
          const SizedBox(height: 50),
          TextFieldWidget(
            controller: controller.nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
            ),
            label: 'fullName'.tr,
          ),
          TextFieldWidget(
            enabled: false,
            controller: controller.emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email,
            ),
            label: "email".tr,
          ),
          TextFieldWidget(
            enabled: false,
            controller: controller.phoneController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.phone_android,
            ),
            label: 'phoneNum'.tr,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                Get.back();
                //add func
                print(controller.nameController.text);
                print("hhhhhh");
                 var data = ProfileModel(
                   email: controller.emailController.text,
                   name: controller.nameController.text,
                   phoneNum: controller.phoneController.hashCode,
                   id: "profileModel?.id",
                );
                var respone = await profileController.updateData(data);
                print(respone);
                print("mmmmmm");
                profileController.refreshData();
                profileController.clearController();
              },
              child: Text('Edit'.tr)),
        ]);
  }
}
