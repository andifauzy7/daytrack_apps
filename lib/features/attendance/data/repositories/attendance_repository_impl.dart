import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/network/network_info.dart';
import 'package:daytrack_apps/features/attendance/data/datasources/attendance_local_data_source.dart';
import 'package:daytrack_apps/features/attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:daytrack_apps/features/attendance/data/mapper/attendance_mapper.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource remoteDataSource;
  final AttendanceLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AttendanceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Question>>> getListQuestions() async {
    try {
      final questions = await localDataSource.getQuestions();

      return Right(
        questions
            .map((e) => AttendanceMapper.convertQuestionModelToQuestion(e))
            .toList(),
      );
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> setAttendanceRecord(
      AttendanceRecord attendanceRecord) async {
    try {
      final result = await localDataSource.cacheAttendanceRecord(
        AttendanceMapper.convertAttendanceRecordToAttendanceRecordModel(
            attendanceRecord),
      );
      return Right(result);
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, AttendanceRecord>> getAttendanceRecord(
      DateTime date) async {
    try {
      final questions = await localDataSource.getAttendanceRecord(date);
      return Right(
        AttendanceMapper.convertAttendanceRecordModelToAttendanceRecord(
            questions),
      );
    } on CacheException {
      final failure = CacheFailure();
      return Left(failure);
    }
  }
}
