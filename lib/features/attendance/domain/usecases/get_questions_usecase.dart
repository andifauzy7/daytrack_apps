import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';

class GetQuestionsUsecase extends UseCase<List<Question>, NoParams> {
  final AttendanceRepository repository;

  GetQuestionsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Question>>> call(NoParams params) async {
    return await repository.getListQuestions();
  }
}
