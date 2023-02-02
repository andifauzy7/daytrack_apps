class OptionAnswerModel {
  String? emoji;
  String? body;
  String? image;

  OptionAnswerModel({
    this.image,
    this.emoji,
    this.body,
  });

  OptionAnswerModel.fromJson(Map<String, dynamic> json) {
    emoji = json['emoji'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emoji'] = emoji;
    data['body'] = body;
    data['image'] = image;
    return data;
  }
}
