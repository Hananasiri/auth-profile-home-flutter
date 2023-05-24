import 'package:get/get.dart';
import '../../features/auth/logic/controller/auth_controller.dart';
import '../../features/initial/controller/initial_controller.dart';
import '../../features/profile/logic/controller/profile_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => ProfileController());
    Get.find<ProfileController>();
   // Get.put(ProfileController());
  }
}