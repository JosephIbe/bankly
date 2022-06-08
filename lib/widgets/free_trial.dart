import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late Size size;
const int mobileScreenSize = 375;

class FreeTrial extends StatelessWidget {

  const FreeTrial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_50 : Sizes.dimen_70,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_20 : Sizes.dimen_0,
        right: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_20 : Sizes.dimen_0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_0 : Sizes.dimen_18,
        vertical: Sizes.dimen_8,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_6)),
        color: const HSLColor.fromAHSL(1, 248, .32, .49).toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: TextLiterals.tryItFree,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.dimen_13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                TextSpan(
                  text: TextLiterals.thenMonthly,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: Sizes.dimen_13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }

}