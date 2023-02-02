import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:equatable/equatable.dart';

class SetAttendanceRecordUsecase extends UseCase<bool, SetAttendanceParams> {
  final AttendanceRepository repository;

  SetAttendanceRecordUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetAttendanceParams params) async {
    return await repository.setAttendanceRecord(params.attendanceRecord);
  }
}

class SetAttendanceParams extends Equatable {
  final AttendanceRecord attendanceRecord;

  const SetAttendanceParams({
    required this.attendanceRecord,
  });

  @override
  List<Object> get props => [attendanceRecord];
}
