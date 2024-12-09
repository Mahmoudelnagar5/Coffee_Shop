import 'package:caffeine_corner/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/custom_login_buttons.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;
  String? password;
  String? confirmPassword;
  String? fullName;
  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Apptheme.brownColor,
                  Apptheme.buttonBackground1Color,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: GoogleFonts.amiri(
                  fontSize: 35.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextField(
                        hintText: 'Full Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 30),
                      const CustomTextField(
                        hintText: 'Email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 30),
                      const CustomTextField(
                        hintText: 'Password',
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 30),
                      const CustomTextField(
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        width: double.infinity,
                        height: 50,
                        color: Apptheme.buttonBackground1Color,
                        onTap: null,
                        child: Text(
                          'Sign Up',
                          style: Apptheme.introtitle.copyWith(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const CustomLoginButtons(
                        text1: "Already have an account? ",
                        text2: "Sign in",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
