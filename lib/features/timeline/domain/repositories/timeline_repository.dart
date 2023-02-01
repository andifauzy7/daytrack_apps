import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:daytrack_apps/features/timeline/domain/entities/news.dart';

abstract class TimelineRepository {
  Future<Either<Failure, List<News>>> getLatestNews();
}
