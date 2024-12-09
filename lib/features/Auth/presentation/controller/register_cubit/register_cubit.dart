import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  String password = "";
  String email = "";

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());

      var result =
          await authRepo.signupfirebase(email: email, password: password);
      result.fold((failure) {
        emit(
          RegisterFailure(errorMessage: failure.errorMessage),
        );
      }, (success) {
        emit(RegisterSuccess());
      });
    } on Exception catch (e) {
      log('e: $e');
    }
  }

  void setregisteremail({required String n}) {
    email = n;
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
