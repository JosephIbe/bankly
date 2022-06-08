import 'package:flutter/material.dart';

import 'package:bankly_app/widgets/form_container.dart';
import 'package:bankly_app/widgets/free_trial.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';

late Size size;

class MobileView extends StatelessWidget {

  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size; // get device width and height from Size object once the FCP is ready

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                  vertical: Sizes.dimen_15,
                ),
                decoration: BoxDecoration(
                  color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value to a shade of red
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/png/bg-intro-desktop.png', // add background image to container
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    TextLiterals.titleText,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: Sizes.dimen_23,
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
                                            fontSize: Sizes.dimen_12,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                  ),
                                ]
                            ),
                          ),

                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  FreeTrial(),
                                  SizedBox(height: Sizes.dimen_15),
                                  FormContainer()
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
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