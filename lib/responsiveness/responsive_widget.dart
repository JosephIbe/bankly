import 'package:flutter/material.dart';

const int desktopScreenSize = 1440;
const int mobileScreenSize = 375;

class ResponsiveWidget extends StatelessWidget {

  final Widget desktopScreen;
  final Widget mobileScreen;
  const ResponsiveWidget({Key? key,required this.mobileScreen,required this.desktopScreen,}) : super(key: key);

  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileScreenSize;
  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double _width = constraints.maxWidth;
          if(_width <= mobileScreenSize){
            return mobileScreen;
          } else {
            return desktopScreen;
          }
        }
    );
  }
}