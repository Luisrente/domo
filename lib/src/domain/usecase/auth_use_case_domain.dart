import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/errors/failures.dart';
import '../repository/repository_domain.dart';

class AuthUseCaseDomnain {
  final AuthRepositoryDomain authRepositoryDomain;

  AuthUseCaseDomnain({required this.authRepositoryDomain});

  Future<Either<Failure, UserCredential>> signInWithPhone(
          {required PhoneAuthCredential phoneAuthCredential}) =>
      authRepositoryDomain.signInWithPhone(
          phoneAuthCredential: phoneAuthCredential);
  Future<Either<Failure, bool>> verifySession() =>
      authRepositoryDomain.verifySession();
  Future<Either<Failure, void>> logOut() => authRepositoryDomain.logOut();
}
