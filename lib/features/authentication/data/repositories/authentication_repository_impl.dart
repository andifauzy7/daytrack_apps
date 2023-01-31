import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/network/network_info.dart';
import 'package:daytrack_apps/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:daytrack_apps/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:daytrack_apps/features/authentication/data/mapper/authentication_mapper.dart';
import 'package:daytrack_apps/features/authentication/data/models/user_model.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> getLoginSession() async {
    try {
      final loginSession = await localDataSource.getLoginSession();
      return Right(loginSession);
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> getOnboardingSession() async {
    try {
      final onboardSession = await localDataSource.getOnboardingSession();
      return Right(onboardSession);
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> setLoginSession(UserSignIn userSignIn) async {
    try {
      UserModel user = await localDataSource.getUserData();
      if (user.email == userSignIn.email &&
          user.password == userSignIn.password) {
        final loginSession = await localDataSource.cacheLoginSession(
          AuthenticationMapper.convertUserSignInToUserSignInModel(userSignIn),
        );
        return Right(loginSession);
      } else {
        return Left(
          CacheFailure(),
        );
      }
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> setOnboardingSession() async {
    try {
      final onboardSession = await localDataSource.cacheOnboardingSession();
      return Right(onboardSession);
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> setDefaultUser() async {
    try {
      final user = await localDataSource.cacheUserData(
        const UserModel(
          name: 'Andi Fauzy Dewantara',
          email: 'andi@daytrack.com',
          password: 'a12345678',
        ),
      );
      return Right(user);
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }
}
