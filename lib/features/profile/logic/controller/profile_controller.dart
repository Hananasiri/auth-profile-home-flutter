import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/constants/api_string.dart';
import '../../model/profile_model.dart';
import '../service/profile_repo.dart';

class ProfileController extends GetxController {
  final apiService = ProfileService();
  GetStorage authStorage = GetStorage();
  String? profilePhoto = '';
  File? pickedFileApp;
  Uint8List? pickedFileWeb;
  bool isLoading = false;

  //for controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  var selectedDate = DateTime
      .now()
      .obs;
  bool isDate = false;

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

  updateData(ProfileModel model) async {
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
  pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      isLoading = true;
      Uint8List? fileBytes = result.files.first.bytes;
      PlatformFile file = result.files.first;
      GetPlatform.isWeb
          ? pickedFileWeb = fileBytes
          : pickedFileApp = File('${file.path}');
      isLoading = false;
      update();
    } else {
      Get.snackbar('', "You don't pick a image");
    }
  }
  }
