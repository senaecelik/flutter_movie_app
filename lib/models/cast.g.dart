// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Casts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'results': instance.results,
    };

Casts _$CastsFromJson(Map<String, dynamic> json) => Casts(
      originalName: json['originalName'] as String?,
      castId: json['castId'] as int?,
      character: json['character'] as String?,
      creditId: json['creditId'] as String?,
      order: json['order'] as int?,
    )
      ..adult = json['adult'] as bool?
      ..alsoKnownAs = (json['alsoKnownAs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..biography = json['biography'] as String?
      ..birthday = json['birthday'] as String?
      ..deathday = json['deathday'] as String?
      ..gender = json['gender'] as int?
      ..homepage = json['homepage'] as String?
      ..id = json['id'] as int?
      ..imdbId = json['imdbId'] as String?
      ..knownForDepartment = json['knownForDepartment'] as String?
      ..name = json['name'] as String?
      ..placeOfBirth = json['placeOfBirth'] as String?
      ..popularity = (json['popularity'] as num?)?.toDouble()
      ..profilePath = json['profilePath'] as String?;

Map<String, dynamic> _$CastsToJson(Casts instance) => <String, dynamic>{
      'adult': instance.adult,
      'alsoKnownAs': instance.alsoKnownAs,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'gender': instance.gender,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'knownForDepartment': instance.knownForDepartment,
      'name': instance.name,
      'placeOfBirth': instance.placeOfBirth,
      'popularity': instance.popularity,
      'profilePath': instance.profilePath,
      'originalName': instance.originalName,
      'castId': instance.castId,
      'character': instance.character,
      'creditId': instance.creditId,
      'order': instance.order,
    };
