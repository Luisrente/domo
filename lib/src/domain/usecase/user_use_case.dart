import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user_entities.dart';
import '../repository/repository_domain.dart';

class UserUSerCaseDomain {
  final UserRepositoryDomain userRepositoryDomain;

  UserUSerCaseDomain({
    required this.userRepositoryDomain,
  });

  Future<Either<Failure, bool>> createUser(
          {required Map<String, dynamic> data}) =>
      userRepositoryDomain.createUser(data: data);
  Future<Either<Failure, bool>> updateUser(
          {required Map<String, dynamic> data, required String id}) =>
      userRepositoryDomain.updateUser(data: data, id: id);
  Future<Either<Failure, UserEntities>> getUser({required String id}) =>
      userRepositoryDomain.getUser(id: id);
  Future<Either<Failure, String>> getToken({required String id}) =>
      userRepositoryDomain.getToken(id: id);
  Future<Either<Failure, UserEntities>>  getUserServer({required String id})=>userRepositoryDomain.getUserServer(id: id);


}
