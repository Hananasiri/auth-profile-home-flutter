import 'package:flutter/material.dart';

import '../constants/size.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileLarge,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= smallScreenSize;
  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= mediumScreenSize;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < largeScreenSize;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 715 && size.height > 550) {
        return desktop;
      } else if (size.width >= mediumScreenSize && tablet != null) {
        return tablet!;
      } else if (size.width >= smallScreenSize && mobileLarge != null) {
        return mobileLarge!;
      } else {
        return mobile;
      }
    });
  }
}
