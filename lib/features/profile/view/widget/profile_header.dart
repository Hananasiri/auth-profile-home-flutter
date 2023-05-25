import 'package:auth_profile_home_flutter/features/auth/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/theme/controller/colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<AuthController>(builder: (authController) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            authController.isLoading
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: lightColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.lodingImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Stack(children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: lightColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.profileImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ]),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(
              //"Hello user",
              authController.nameController.text,
              style: theme.headlineLarge,
            ),
            Text(
              // "example@gmail.com",
              authController.emailController.text,
              style: theme.headlineSmall,
            ),
            Text(
              //"505678665",
              authController.phoneController.text,
              style: theme.headlineSmall,
            ),
            Text(
              //"04/04/1993",
              authController.dateController.text,
              style: theme.headlineSmall,
            ),
          ],
        ),
      );
    });
  }
}
