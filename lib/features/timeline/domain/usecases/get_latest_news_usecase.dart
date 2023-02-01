import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/timeline/domain/entities/news.dart';
import 'package:daytrack_apps/features/timeline/domain/repositories/timeline_repository.dart';

class GetLatestNewsUsecase extends UseCase<List<News>, NoParams> {
  final TimelineRepository repository;

  GetLatestNewsUsecase(this.repository);

  @override
  Future<Either<Failure, List<News>>> call(NoParams params) async {
    return await repository.getLatestNews();
  }
}
