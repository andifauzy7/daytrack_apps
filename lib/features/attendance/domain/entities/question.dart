import 'package:daytrack_apps/features/attendance/domain/entities/option_answer.dart';
import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String title;
  final String question;
  final List<OptionAnswer> option;
  int? answer;

  Question({
    required this.title,
    required this.question,
    required this.option,
    this.answer,
  });

  @override
  List<Object?> get props => [
        title,
        question,
        option,
        answer,
      ];
}
