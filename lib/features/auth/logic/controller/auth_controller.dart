import 'package:auth_profile_home_flutter/features/auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/api_string.dart';
import '../../../../core/constants/keys.dart';
import '../../../../core/theme/controller/colors.dart';
import '../../../Home/logic/service/api_service.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final apiService = ApiService();
  bool isLoading = false;
  GetStorage authStorage = GetStorage();

  //for controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  var selectedDate = DateTime.now().obs;
  bool isDate = false;

  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  // refreshData() {
  //   update();
  // }
  @override
  void onInit() {
    super.onInit();
    emailController.text =
        authStorage.read(AppKeys.emailKey) ?? emailController.text;
  }

  // clearController() {
  //   nameController.clear();
  //   emailController.clear();
  //   phoneController.clear();
  //   dateController.clear();
  //  }
  signUpWithEmail(AuthModel model) async {
    await apiService.postData(
      url: ApiString.AuthUrl,
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
        'birth_date': model.birthDate,
      },
      headers: headers,
    );
  }

  updateData(AuthModel model) async {
    await apiService.updateData(
      url: ApiString.AuthUrl,
      id: "${model.id}",
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
      },
      headers: headers,
    );
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1930),
        lastDate: DateTime(2024),
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
}
