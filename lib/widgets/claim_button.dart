import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late Size size;
const int mobileScreenSize = 375;

class ClaimButton extends StatelessWidget {

  final VoidCallback onClicked;

  const ClaimButton({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: size.width,
        height: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_50 : Sizes.dimen_60,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.dimen_8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_6)),
          color: const HSLColor.fromAHSL(1, 154, .59, .51).toColor(),
        ),
        child: Center(
          child: Text(
            TextLiterals.claimTrial.toUpperCase(),
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w500,
              )
            ),
          )
        )
      ),
    );
  }

}