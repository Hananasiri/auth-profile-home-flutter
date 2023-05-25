import 'package:auth_profile_home_flutter/features/auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/route.dart';
import '../../../auth/logic/controller/auth_controller.dart';
import '../../../auth/view/widget/TextFieldWidget.dart';

class PersonalInformationWidget extends StatelessWidget {
   PersonalInformationWidget({Key? key, required this.authController, this.authModel
   }): super(key: key);

  final  AuthController authController;
  final Controller = Get.put(AuthController());
  //  final controller = Get.find<ProfileController>();

   final AuthModel? authModel;
  @override
  Widget build(BuildContext context) {

    // Controller.nameController.text = authModel!.name;
    // Controller.emailController.text = authModel!.email;
    // Controller.phoneController.text = authModel!.phoneNum as String;


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
            controller: Controller.nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
            ),
            label: 'fullName'.tr,
          ),
          TextFieldWidget(
            controller: Controller.emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email,
            ),
            label: "email".tr,
          ),
          TextFieldWidget(
            controller:  Controller.phoneController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.phone_android,
            ),
            label: 'phoneNum'.tr,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                Get.offNamed(Routes.profileScreen);
                //add func
                print(Controller.nameController.text);
                 var data = AuthModel(
                   email: Controller.emailController.text,
                   name: Controller.nameController.text,
                   phoneNum: Controller.phoneController.hashCode,
                   id: "profileModel?.id",
                   birthDate: Controller.dateController.hashCode,
                );
                var respone = await Controller.updateData(data);
                print(respone);
                print("resppone");
               // authController.refreshData();
                //profileController.clearController();
              },
              child: Text('Edit'.tr)),
        ]);
  }
}
