import 'package:bankly_app/widgets/form_container.dart';
import 'package:bankly_app/widgets/free_trial.dart';
import 'package:flutter/material.dart';

import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';

import 'package:google_fonts/google_fonts.dart';

late Size size;

class DesktopView extends StatelessWidget {

  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size; // get device width and height from Size object once the FCP is ready

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: Sizes.dimen_15,
          ),
          decoration: BoxDecoration(
            color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value to a shade of red
            image: const DecorationImage(
              image: AssetImage(
                'assets/png/bg-intro-desktop.png' // add background image to container
              )
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: Sizes.dimen_40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextLiterals.titleText,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dimen_40,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                        ),
                        const SizedBox(height: Sizes.dimen_10),
                        Text(
                          TextLiterals.descriptionText,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dimen_14,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                        ),
                      ]
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FreeTrial(),
                    SizedBox(height: Sizes.dimen_15),
                    FormContainer()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}