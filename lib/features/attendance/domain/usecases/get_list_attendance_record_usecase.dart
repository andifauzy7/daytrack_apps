import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';

class GetListAttendanceRecordUsecase
    extends UseCase<List<AttendanceRecord>, NoParams> {
  final AttendanceRepository repository;

  GetListAttendanceRecordUsecase(this.repository);

  @override
  Future<Either<Failure, List<AttendanceRecord>>> call(NoParams params) async {
    return await repository.getListAttendanceRecord();
  }
}
