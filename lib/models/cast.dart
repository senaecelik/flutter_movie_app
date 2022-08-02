import 'package:flutter_application/models/person.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable()
class Cast {
  List<Casts>? results;
  Cast({this.results});

  factory Cast.fromJson(
      Map<String, dynamic> json) {
    return _$CastFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CastToJson(this);
  }
}

@JsonSerializable()
class Casts extends Person {
  String? originalName;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Casts(
      {this.originalName,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  factory Casts.fromJson(
      Map<String, dynamic> json) {
    return _$CastsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CastsToJson(this);
  }
}

