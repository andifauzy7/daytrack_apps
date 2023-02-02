import 'package:equatable/equatable.dart';

class OptionAnswer extends Equatable {
  final String? image;
  final String? emoji;
  final String body;

  const OptionAnswer({
    this.image,
    this.emoji,
    required this.body,
  });

  @override
  List<Object?> get props => [
        image,
        emoji,
        body,
      ];
}
