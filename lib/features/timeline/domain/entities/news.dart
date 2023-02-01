import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String urlToImage;
  final String url;
  final String description;

  const News({
    required this.title,
    required this.urlToImage,
    required this.url,
    required this.description,
  });

  @override
  List<Object?> get props => [
        title,
        urlToImage,
        url,
        description,
      ];
}
