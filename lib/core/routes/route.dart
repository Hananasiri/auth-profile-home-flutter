import 'package:auth_profile_home_flutter/features/Home/view/screen/home_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/view/screen/signup_screen.dart';
import '../../features/initial/view/screen/initial_screen.dart';
import '../../features/profile/view/screen/personal_information_screen.dart';
import '../../features/profile/view/screen/profile_screen.dart';
import '../binding/binding.dart';

class AppRoutes {
  static final routes = [

    GetPage(
      name: Routes.initialScreen,
      page: () => InitialScreen(),
      binding: Binding(),
    ),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: Binding()
    ),

    GetPage(
        name: Routes.profileScreen,
        page: () => const ProfileScreen(),
        binding: Binding()
    ),

    GetPage(
        name: Routes.homeScreen,
        page: () =>  HomeScreen(),
        binding: Binding()
    ),

    GetPage(
        name: Routes.personalInformation,
        page: () => const PersonalInformationScreen(),
        binding: Binding()
    ),
  ];

}

class Routes {

  static const initialScreen = '/initial_screen';
  static const signScreen = '/signup_screen';
  static const homeScreen = '/home_screen';
  static const profileScreen = '/profile_screen';
  static const personalInformation = '/personal_information';
}
