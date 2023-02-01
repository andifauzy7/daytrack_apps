import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:daytrack_apps/core/network/network_info.dart';
import 'package:daytrack_apps/features/timeline/data/datasources/timeline_local_data_source.dart';
import 'package:daytrack_apps/features/timeline/data/datasources/timeline_remote_data_source.dart';
import 'package:daytrack_apps/features/timeline/data/mapper/timeline_mapper.dart';
import 'package:daytrack_apps/features/timeline/data/models/news_model_dto.dart';
import 'package:daytrack_apps/features/timeline/domain/entities/news.dart';
import 'package:daytrack_apps/features/timeline/domain/repositories/timeline_repository.dart';

class TimelineRepositoryImpl implements TimelineRepository {
  final TimelineRemoteDataSource remoteDataSource;
  final TimelineLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TimelineRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<News>>> getLatestNews() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final newsModel = await remoteDataSource.getLatestNews();
        localDataSource.cacheLatestNews(newsModel.news ?? []);
        List<News> news = (newsModel.news ?? [])
            .map(
              (data) => TimelineMapper.convertUserNewsModelToNews(data),
            )
            .toList();
        return Right(news);
      } on ServerException {
        final failure = ServerFailure();
        return Left(failure);
      }
    } else {
      try {
        List<NewsModel> newsModel = await localDataSource.getLatestNews();
        List<News> news = (newsModel)
            .map(
              (data) => TimelineMapper.convertUserNewsModelToNews(data),
            )
            .toList();
        return Right(news);
      } on CacheException {
        final failure = CacheFailure();
        return Left(failure);
      }
    }
  }
}
