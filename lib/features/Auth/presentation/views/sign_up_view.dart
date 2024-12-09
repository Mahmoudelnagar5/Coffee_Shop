import 'package:caffeine_corner/core/utils/app_theme.dart';
import 'package:caffeine_corner/features/Auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/functions/show_message.dart';
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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                child: BlocListener<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterFailure) {
                      showSnackBar(context, state.errorMessage);
                    } else if (state is RegisterSuccess) {
                      showSnackBar(context, 'Login Success');
                    }
                  },
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hintText: 'Full Name',
                          prefixIcon: Icons.person,
                          onSaved: (value) {
                            fullName = value;
                          },
                          suffixIcon: null,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          hintText: 'Email',
                          prefixIcon: Icons.email,
                          onSaved: (value) {
                            email = value;
                            BlocProvider.of<RegisterCubit>(context)
                                .setregisteremail(n: email!);
                          },
                          suffixIcon: null,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                          obscureText:
                              !isPasswordVisible, // Toggle visibility here
                          onSaved: (value) {
                            password = value;
                            BlocProvider.of<RegisterCubit>(context)
                                .setregisterpassword(p: password!);
                          },
                          onIconPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          suffixIcon: isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock,
                          onSaved: (value) {
                            confirmPassword = value;
                          },
                          obscureText:
                              !isConfirmPasswordVisible, // Toggle visibility here
                          onIconPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          suffixIcon: isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          width: double.infinity,
                          height: 50,
                          color: Apptheme.buttonBackground1Color,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                var cubit =
                                    BlocProvider.of<RegisterCubit>(context);
                                formKey.currentState!.save();
                                await cubit.register(
                                  email: cubit.email,
                                  password: cubit.password,
                                );
                              } catch (e) {
                                showSnackBar(context, e.toString());
                              }
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          child: BlocBuilder<RegisterCubit, RegisterState>(
                            builder: (context, state) {
                              if (state is RegisterLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Sign Up',
                                  style: Apptheme.introtitle.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                );
                              }
                            },
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
          ),
        ],
      ),
    );
  }
}
