import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:equatable/equatable.dart';

class GetAttendanceRecordUsecase
    extends UseCase<AttendanceRecord, GetAttendanceParams> {
  final AttendanceRepository repository;

  GetAttendanceRecordUsecase(this.repository);

  @override
  Future<Either<Failure, AttendanceRecord>> call(
      GetAttendanceParams params) async {
    return await repository.getAttendanceRecord(params.date);
  }
}

class GetAttendanceParams extends Equatable {
  final DateTime date;

  const GetAttendanceParams({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}
