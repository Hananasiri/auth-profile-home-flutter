import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ProfileController extends GetxController {
  //final ProfileService _profileService = ProfileService();
  GetStorage authStorage = GetStorage();

  String? profilePhoto = '';
  File? pickedFileApp;
  Uint8List? pickedFileWeb;
  bool isLoading = false;

  //Password icon
  bool isVisibility = false;

  //Personal Info
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  ///////////////////onInit///////////////////////////
  @override
  void onInit() async {
   // await getUserInfo();
    super.onInit();
  }

  //fun for Password icon
  void visibility() {
    isVisibility = !isVisibility;
    update();
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

  // getUserInfo() {
  //  var user = _profileService.getUserInfo(authStorage.read(AppKeys.authKey) ?? '');
  //   nameController.text = user?.displayName ?? 'Hello user';
  //   emailController.text = user?.email ?? 'example@gmail.com';
  //   phoneController.text = user?.phoneNumber ?? "05000000000";
  //   profilePhoto = user?.photoURL;
  // }

  // updateUserName({required String userName}) async {
  //   // await _profileService.updateUserName(
  //   //   uid: authStorage.read(AppKeys.authKey),
  //   //   userName: userName,
  //   //   onError: (e) {
  //   //     Get.snackbar('something went wrong', e.toString());
  //   //   },
  //   //   onDone: () {
  //   //     Get.offNamed(Routes.profileScreen);
  //   //   },
  //   // );
  // }
  // updateUserPhoto() async {
  //   // isLoading = true;
  //   // await _profileService.updateUserPhoto(
  //   //     uid: authStorage.read(AppKeys.authKey),
  //   //     pickedFile: GetPlatform.isWeb ? pickedFileWeb : pickedFileApp,
  //   //     onError: (e) {
  //   //       Get.snackbar('something went wrong', e.toString());
  //   //       isLoading = false;
  //   //     },
  //   //     onDone: () {
  //   //       getUserInfo();
  //   //       isLoading = false;
  //   //       update();
  //   //       Get.snackbar('Photo is updated', "");
  //   //
  //   //     }
  //   // );
  // }

  // signOut() async {
  //   // await _profileService.signOut(
  //   //   onError: (String e) {
  //   //     Get.snackbar(
  //   //       'something went wrong',
  //   //       e,
  //   //     );
  //   //   },
  //   //   onDone: () {
  //   //     authStorage.remove(AppKeys.authKey);
  //   //     authStorage.remove(AppKeys.roleKey);
  //   //     Get.offAllNamed(Routes.signScreen);
  //   //   },
  //   // );
  // }
}
