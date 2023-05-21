import 'package:auth_profile_home_flutter/core/theme/controller/theme.dart';
import 'package:auth_profile_home_flutter/features/auth/view/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routes/route.dart';
import 'core/theme/controller/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeController().themeDataGet,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      //locale: controller.initialLang,
      initialRoute: Routes.signScreen,
      getPages: AppRoutes.routes,

    );
  }
}
