import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> signinfirebase({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserCredential>> signupfirebase({
    required String email,
    required String password,
  });
}
