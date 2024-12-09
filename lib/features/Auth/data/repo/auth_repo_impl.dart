import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserCredential>> signinfirebase(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signupfirebase(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  ServerFaliure firebasecatch(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return ServerFaliure(errorMessage: "weak-password");
    } else if (e.code == 'email-already-in-use') {
      return ServerFaliure(errorMessage: "email-already-in-use");
    } else if (e.code == 'invalid-email') {
      return ServerFaliure(errorMessage: "invalid-email");
    } else if (e.code == 'user-not-found') {
      return ServerFaliure(errorMessage: "user-not-found");
    } else if (e.code == 'wrong-password') {
      return ServerFaliure(errorMessage: "wrong-password");
    } else if (e.code == 'too-many-requests') {
      return ServerFaliure(errorMessage: "too-many-requests");
    } else if (e.code == 'operation-not-allowed') {
      return ServerFaliure(errorMessage: "operation-not-allowed");
    } else {
      return ServerFaliure(errorMessage: "${e.code}, try again");
    }
  }
}
