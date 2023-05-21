import 'package:get/get.dart';

import '../../features/auth/view/screen/signup_screen.dart';
import '../binding/binding.dart';

class AppRoutes {
  static final routes = [


    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: Binding()
    ),
  ];

}

class Routes {
  static const signScreen = '/signup_screen';
}
