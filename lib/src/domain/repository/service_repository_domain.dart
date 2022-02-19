import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/service_entities.dart';

abstract class ServiceRepositoryDomanin{

  Future<Either<Failure, bool>> createService({required Map<String, dynamic> data, required List<String> file});
  Future<Either<Failure, List<ServiceEntities>>> getServiceById({required String id});
  Future<Either<Failure, List<dynamic>>> getAllService();
  Future<Either<Failure, bool>> updateData({required Map<String, dynamic> data, required String id });
}