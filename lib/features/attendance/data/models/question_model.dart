import 'option_answer_model.dart';

class QuestionModel {
  String? title;
  String? question;
  List<OptionAnswerModel>? option;
  int? answer;

  QuestionModel({this.title, this.question, this.option, this.answer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['option'] != null) {
      option = <OptionAnswerModel>[];
      json['option'].forEach((v) {
        option!.add(OptionAnswerModel.fromJson(v));
      });
    }
    answer = json['answer'];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    data['answer'] = answer;
    data['title'] = title;
    return data;
  }
}
