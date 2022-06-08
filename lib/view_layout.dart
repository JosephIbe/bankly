import 'package:bankly_app/responsiveness/responsive_widget.dart';
import 'package:bankly_app/views/desktop_view.dart';
import 'package:bankly_app/views/mobile_view.dart';
import 'package:flutter/material.dart';

class ViewLayout extends StatelessWidget {

  const ViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(desktopScreen: DesktopView(), mobileScreen:  MobileView()),
    );
  }

}