import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';
import 'package:bankly_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {

  final TextEditingController controller;
  final String placeHolderText;
  final TextInputType textInputType;
  final FormFieldValidator validator;

  const CustomInput({
    Key? key,
    required this.controller,
    required this.placeHolderText,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      enabled: true,
      builder: (FormFieldState formFieldState){
        return Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: Sizes.dimen_50,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_6)),
                border: Border.all(
                  color: formFieldState.hasError
                    ? const HSLColor.fromAHSL(1, 0, 1, .74).toColor()
                    : Colors.grey,
                  width: formFieldState.hasError ? 1.5 : Sizes.dimen_1
                ),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      validator: validator,
                      controller: controller,
                      keyboardType: textInputType,
                      onChanged: (value) => formFieldState.didChange(value),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: Sizes.dimen_16,
                          fontWeight: FontWeight.w600,
                          color: formFieldState.hasError
                            ? const HSLColor.fromAHSL(1, 0, 1, .74).toColor()
                            : const HSLColor.fromAHSL(1, 246, .1, .26).toColor(),
                        )
                      ),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // hintText: formFieldState.hasError ? ' ' : placeHolderText,
                        hintText: placeHolderText,
                        contentPadding: const EdgeInsets.symmetric(vertical: Sizes.dimen_10, horizontal: Sizes.dimen_22),
                        border: InputBorder.none,
                        errorStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value,
                            fontSize: Sizes.dimen_0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        errorBorder: InputBorder.none,
                        hintStyle: const TextStyle(
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  formFieldState.hasError
                    ? const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: Sizes.dimen_12),
                          child: Icon(Icons.error, color: Colors.red),
                        )
                      )
                    : Container()
                ]
              ),
            ),
            if(formFieldState.hasError)
              Offstage(
                offstage: !formFieldState.hasError,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    formFieldState.isValid
                        ? ''
                        : formFieldState.errorText.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value,
                        fontSize: Sizes.dimen_11,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  // child: Visibility(
                  //   // visible: formFieldState.isValid,
                  //     visible: false,
                  //     child: Text(
                  //       formFieldState.isValid
                  //           ? ''
                  //           : TextLiterals.emptyFirstName,
                  //       style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(
                  //           color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(), // set HSL color value,
                  //           fontSize: Sizes.dimen_11,
                  //           fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //     )
                  // ),
                ),
              )
          ],
        );
      },
    );
  }

}