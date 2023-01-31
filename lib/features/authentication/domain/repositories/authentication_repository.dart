import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> setDefaultUser();
  Future<Either<Failure, bool>> getLoginSession();
  Future<Either<Failure, bool>> setLoginSession(UserSignIn userSignIn);
  Future<Either<Failure, bool>> getOnboardingSession();
  Future<Either<Failure, bool>> setOnboardingSession();
}
