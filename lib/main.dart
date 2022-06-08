import 'package:bankly_app/common/constants/text_constants.dart';
import 'package:bankly_app/view_layout.dart';
import 'package:bankly_app/views/mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextLiterals.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
        ).apply(bodyColor: Colors.black),
      ),
      home: const ViewLayout(),
    );
  }

}