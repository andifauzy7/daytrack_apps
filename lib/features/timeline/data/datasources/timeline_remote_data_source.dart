import 'dart:convert';

import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/features/timeline/data/models/news_model_dto.dart';
import 'package:http/http.dart';

// ignore: constant_identifier_names
const HOST_API = 'https://newsapi.org';
// ignore: constant_identifier_names
const API_KEY = '5426e54fb2004fe493126188b4ceadd5';

abstract class TimelineRemoteDataSource {
  Future<NewsModelDTO> getLatestNews();
}

class TimelineRemoteDataSourceImpl implements TimelineRemoteDataSource {
  final Client client;

  TimelineRemoteDataSourceImpl({required this.client});

  @override
  Future<NewsModelDTO> getLatestNews() async {
    final uri =
        Uri.parse('$HOST_API/v2/top-headlines?country=id&apiKey=$API_KEY');

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await client.get(uri, headers: headers);
    final responseBody = response.body;
    final responseCode = response.statusCode;
    if (responseCode == 200) {
      final jsonResponse = jsonDecode(responseBody);
      final newsModel = NewsModelDTO.fromJson(jsonResponse);

      return newsModel;
    } else {
      throw ServerException();
    }
  }
}
