import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';

class GetOnboardingSessionUsecase extends UseCase<bool, NoParams> {
  final AuthenticationRepository repository;

  GetOnboardingSessionUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getOnboardingSession();
  }
}
