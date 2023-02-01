import 'package:daytrack_apps/features/timeline/data/models/news_model_dto.dart';
import 'package:daytrack_apps/features/timeline/domain/entities/news.dart';

class TimelineMapper {
  static News convertUserNewsModelToNews(NewsModel newsModel) => News(
        title: newsModel.title ?? '',
        urlToImage: newsModel.urlToImage ?? '',
        url: newsModel.url ?? '',
        description: newsModel.description ?? '',
      );

  static NewsModel convertUserSignInToUserSignInModel(News news) => NewsModel(
        title: news.title,
        urlToImage: news.urlToImage,
        url: news.url,
        description: news.description,
      );
}
