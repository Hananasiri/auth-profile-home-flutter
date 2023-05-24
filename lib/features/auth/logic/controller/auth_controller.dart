import 'dart:convert';
import 'package:auth_profile_home_flutter/features/auth/model/auth_model.dart';
import 'package:auth_profile_home_flutter/features/profile/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/api_string.dart';
import '../../../../core/theme/controller/colors.dart';
import '../../../Home/logic/service/api_service.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final apiService = ApiService();
  GetStorage authStorage = GetStorage();

  //for controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  refreshData() {
    update();
  }
  @override
  void onInit() {
    super.onInit();
  }
  clearController() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    dateController.clear();
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
      dateController.text =
          DateFormat.yMMMd().format(selectedDate.value).toString();
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

  signUpWithEmail(AuthModel model) async {
    await apiService.postData(
      url: ApiString.AuthbaseUrl,
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
        'birth_date': model.birthDate,
      },
      headers: headers,
    );
  }
  }
