import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {

  final TextEditingController controller;
  final String placeHolderText;
  final TextInputType textInputType;
  final dynamic validator;
  // final ValueChanged<bool> showErrorIcon;

  const InputField({
    Key? key,
    required this.controller,
    required this.placeHolderText,
    required this.textInputType,
    required this.validator,
    // required this.showErrorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: Sizes.dimen_40,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: Sizes.dimen_16,
            fontWeight: FontWeight.w600,
            color: const HSLColor.fromAHSL(1, 246, .1, .26).toColor(),
          )
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: placeHolderText,
          contentPadding: const EdgeInsets.symmetric(vertical: Sizes.dimen_10, horizontal: Sizes.dimen_22),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_6)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: Sizes.dimen_1
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_6)),
            borderSide: BorderSide(
              color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(),
              width: Sizes.dimen_2
            ),
          ),
          errorStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value,
              fontSize: Sizes.dimen_11,
              fontStyle: FontStyle.italic,
            ),
          ),
          hintStyle: const TextStyle(
            fontSize: Sizes.dimen_14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

}