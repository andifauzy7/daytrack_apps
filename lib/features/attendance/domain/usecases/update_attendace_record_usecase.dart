import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateAttendanceRecordUsecase
    extends UseCase<bool, UpdateAttendanceParams> {
  final AttendanceRepository repository;

  UpdateAttendanceRecordUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateAttendanceParams params) async {
    return await repository.updateAttendanceRecord(params.attendanceRecord);
  }
}

class UpdateAttendanceParams extends Equatable {
  final AttendanceRecord attendanceRecord;

  const UpdateAttendanceParams({
    required this.attendanceRecord,
  });

  @override
  List<Object> get props => [attendanceRecord];
}
