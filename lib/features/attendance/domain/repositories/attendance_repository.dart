import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, List<Question>>> getListQuestions();
  Future<Either<Failure, AttendanceRecord>> getAttendanceRecord(DateTime date);
  Future<Either<Failure, bool>> setAttendanceRecord(
      AttendanceRecord attendanceRecord);
}
