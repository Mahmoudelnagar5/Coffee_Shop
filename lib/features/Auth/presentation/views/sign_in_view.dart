import 'package:caffeine_corner/core/utils/app_theme.dart';
import 'package:caffeine_corner/features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:caffeine_corner/features/cafe_home/presentation/views/cafe_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/functions/show_message.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/custom_login_buttons.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email;
  String? password;
  bool isPasswordVisible = false;
  final GlobalKey<FormState> formkey = GlobalKey();

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
                'Hello\nSign in!',
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
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      showSnackBar(context, state.errorMessage);
                    } else if (state is LoginSuccess) {
                      Navigator.pushNamed(context, CafeHomeView.routeName);
                    }
                  },
                  child: Form(
                    key: formkey,
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          CustomTextField(
                            autofillHints: const [AutofillHints.email],
                            hintText: 'Email',
                            prefixIcon: Icons.email,
                            onSaved: (value) {
                              email = value;

                              BlocProvider.of<LoginCubit>(context)
                                  .setloginemail(n: email!);
                            },
                            suffixIcon: null,
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            hintText: 'Password',
                            autofillHints: const [AutofillHints.password],
                            prefixIcon: Icons.lock,
                            suffixIcon: isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onIconPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            obscureText: !isPasswordVisible,
                            onSaved: (value) {
                              password = value;
                              BlocProvider.of<LoginCubit>(context)
                                  .setloginpassword(p: password!);
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            width: double.infinity,
                            height: 45.h,
                            color: Apptheme.buttonBackground1Color,
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  formkey.currentState!.save();
                                  await BlocProvider.of<LoginCubit>(context)
                                      .login(
                                          email: BlocProvider.of<LoginCubit>(
                                                  context)
                                              .email,
                                          password: BlocProvider.of<LoginCubit>(
                                                  context)
                                              .password);
                                } catch (error) {
                                  showSnackBar(context, error.toString());
                                }
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'Sign in',
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
                            text1: "Don't have an account?",
                            text2: "Sign up",
                          ),
                        ],
                      ),
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
