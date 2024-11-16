// To parse this JSON data, do
//
//     final selectTopicResponseModel = selectTopicResponseModelFromJson(jsonString);

import 'dart:convert';

SelectTopicResponseModel selectTopicResponseModelFromJson(String str) =>
    SelectTopicResponseModel.fromJson(json.decode(str));

String selectTopicResponseModelToJson(SelectTopicResponseModel data) =>
    json.encode(data.toJson());

class SelectTopicResponseModel {
  bool error;
  List<Datum> data;

  SelectTopicResponseModel({
    required this.error,
    required this.data,
  });

  factory SelectTopicResponseModel.fromJson(Map<String, dynamic> json) =>
      SelectTopicResponseModel(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int topicId;
  String prompt;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.topicId,
    required this.prompt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        topicId: json["topic_id"],
        prompt: json["prompt"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic_id": topicId,
        "prompt": prompt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
