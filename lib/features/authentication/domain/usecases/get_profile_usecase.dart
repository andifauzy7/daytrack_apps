import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';

class GetProfileUsecase extends UseCase<User, NoParams> {
  final AuthenticationRepository repository;

  GetProfileUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getProfile();
  }
}
