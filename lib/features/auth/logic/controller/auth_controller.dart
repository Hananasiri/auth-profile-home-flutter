import 'package:auth_profile_home_flutter/core/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/controller/colors.dart';


class AuthController extends GetxController {
  GetStorage authStorage = GetStorage();
  bool isVisibility = false;

  //for controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailController.text = authStorage.read(AppKeys.emailKey) ?? '';
  }
//fun for Password icon
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
  var selectedDate = DateTime.now().obs;
  bool isDate = false;
  bool isLocation = false;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black12, // <-- SEE HERE
                onPrimary: greyColor, // <-- SEE HERE
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: greyColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dateController.text = DateFormat.yMMMd().format(selectedDate.value).toString();
      print(dateController.text);

      isDate = true;
      update();
    } else {
      dateController.text =
          DateFormat.yMMMd().format(selectedDate.value).toString();
      isDate = true;
      update();
    }
  }

   signUpWithEmail(
      String email,
      String password,
      String name,
 ) async {
  //   await _authService.signUpWithEmailFirebase(
  //     email: email,
  //     password: password,
  //     name: name,
  //     onDone: (String? uid) async {
  //       if (uid != null) {
  //         await authStorage.write(AppKeys.authKey, uid);
  //         addRole(uId: authStorage.read(AppKeys.authKey), email: email);
  //
  //         clearControllers();
  //         Get.offNamed(Routes.profileScreen);
  //       }
  //     },
  //     onError: (String e) {
  //       Get.snackbar(
  //         'something went wrong',
  //         e,
  //       );
  //     },
   }



  clearControllers() {
    emailController.clear();
    passwordController.clear();
    checkPasswordController.clear();
    phoneController.clear();
  }
}
