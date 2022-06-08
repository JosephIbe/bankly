import 'package:bankly_app/common/constants/size_constants.dart';
import 'package:bankly_app/common/constants/text_constants.dart';
import 'package:bankly_app/widgets/claim_button.dart';
import 'package:bankly_app/widgets/custom_input.dart';
import 'package:bankly_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormContainer extends StatefulWidget {

  const FormContainer({Key? key}) : super(key: key);

  @override
  _FormContainerState createState() => _FormContainerState();

}

class _FormContainerState extends State<FormContainer> {

  late Size size;
  int mobileScreenSize = 375;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.only(

        // only add horizontal margin if the device width is equal to or greater than a desktop screen size

        left: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_20 : Sizes.dimen_0,
        right: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_20 : Sizes.dimen_0,
      ),
      constraints: BoxConstraints(

        // dynamically give the container a minimum height depending on the screen size

        minHeight: MediaQuery.of(context).size.width >= mobileScreenSize ? Sizes.dimen_300 : Sizes.dimen_400
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_6)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_25,
        vertical: Sizes.dimen_20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomInput(
              controller: firstNameController,
              validator: (value){
                if(firstNameController.text.isEmpty){
                  return TextLiterals.emptyFirstName;
                } else {
                  return '';
                }
              },
              textInputType: TextInputType.text,
              placeHolderText: 'First Name',
            ),
            const SizedBox(height: Sizes.dimen_15),

            CustomInput(
              controller: lastNameController,
              validator: (value){
                if(lastNameController.text.isEmpty){
                  return TextLiterals.emptyLastName;
                } else {
                  return '';
                }
              },
              textInputType: TextInputType.text,
              placeHolderText: 'Last Name',
            ),
            const SizedBox(height: Sizes.dimen_15),

            CustomInput(
              controller: emailController,
              validator: (value){
                if(emailController.text.isEmpty){
                  return TextLiterals.emptyEmail;
                }
                if(!RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value)){
                  return TextLiterals.invalidEmail;
                } else if(value.isNotEmpty && RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value)){
                  return '';
                }
              },
              textInputType: TextInputType.emailAddress,
              placeHolderText: 'Email Address',
            ),
            const SizedBox(height: Sizes.dimen_15),

            CustomInput(
              controller: passwordController,
              validator: (value){
                if(passwordController.text.isEmpty){
                  return TextLiterals.emptyPassword;
                } else {
                  return '';
                }
              },
              textInputType: TextInputType.text,
              placeHolderText: 'Password',
            ),
            const SizedBox(height: Sizes.dimen_15),

            ClaimButton(
              onClicked: ()=> validateForm(context),
            ),
            const SizedBox(height: Sizes.dimen_15),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: TextLiterals.byClicking,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const HSLColor.fromAHSL(1, 246, .25, .77).toColor(),
                      fontSize: Sizes.dimen_10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: TextLiterals.termsAndServices,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: const HSLColor.fromAHSL(1, 0, 1, .74).toColor(),
                          fontSize: Sizes.dimen_10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }

  validateForm(BuildContext context) {
    if(_formKey.currentState != null && _formKey.currentState!.validate()){
      print('valid');
    } else {
      print('invalid');
    }
  }

}