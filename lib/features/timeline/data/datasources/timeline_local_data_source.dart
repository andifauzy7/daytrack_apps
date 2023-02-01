import 'dart:convert';

import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/features/timeline/data/models/news_model_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const CACHED_LATEST_NEWS = 'CACHED_LATEST_NEWS';

abstract class TimelineLocalDataSource {
  Future<List<NewsModel>> getLatestNews();
  Future<bool> cacheLatestNews(List<NewsModel> newsModel);
}

class TimelineLocalDataSourceImpl implements TimelineLocalDataSource {
  final SharedPreferences sharedPreferences;

  TimelineLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<List<NewsModel>> getLatestNews() {
    final getNewsResult = sharedPreferences.getString(CACHED_LATEST_NEWS);
    if (getNewsResult == null) {
      throw CacheException();
    } else {
      List<NewsModel> news = (jsonDecode(getNewsResult) as List)
          .map((data) => NewsModel.fromJson(data))
          .toList();
      return Future.value(news);
    }
  }

  @override
  Future<bool> cacheLatestNews(List<NewsModel> newsModel) {
    final cacheNews = sharedPreferences.setString(
      CACHED_LATEST_NEWS,
      jsonEncode(
        newsModel,
      ),
    );
    return Future.value(cacheNews);
  }
}
