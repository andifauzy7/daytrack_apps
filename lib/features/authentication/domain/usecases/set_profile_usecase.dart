import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SetProfileUsecase extends UseCase<bool, SetProfileParams> {
  final AuthenticationRepository repository;

  SetProfileUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetProfileParams params) async {
    return await repository.setProfile(params.user);
  }
}

class SetProfileParams extends Equatable {
  final User user;

  const SetProfileParams({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
