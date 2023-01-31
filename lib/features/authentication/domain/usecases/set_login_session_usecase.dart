import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SetLoginSessionUsecase extends UseCase<bool, SetLoginSessionParams> {
  final AuthenticationRepository repository;

  SetLoginSessionUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetLoginSessionParams params) async {
    return await repository.setLoginSession(
      params.user,
    );
  }
}

class SetLoginSessionParams extends Equatable {
  final UserSignIn user;

  const SetLoginSessionParams({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
