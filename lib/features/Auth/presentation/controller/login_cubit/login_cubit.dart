import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  String password = "";
  String email = "";

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(LoginLoading());

      var result =
          await authRepo.signinfirebase(email: email, password: password);
      result.fold((failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      }, (success) {
        emit(LoginSuccess());
      });
    } on Exception catch (e) {
      log('e: $e');
    }
  }

  void setloginemail({required String n}) {
    email = n;
  }

  void setloginpassword({required String p}) {
    password = p;
  }
}
