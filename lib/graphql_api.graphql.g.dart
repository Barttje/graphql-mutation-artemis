// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertRace$mutation_root$Race_mutation_response$Race
    _$InsertRace$mutation_root$Race_mutation_response$RaceFromJson(
        Map<String, dynamic> json) {
  return InsertRace$mutation_root$Race_mutation_response$Race()
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$InsertRace$mutation_root$Race_mutation_response$RaceToJson(
            InsertRace$mutation_root$Race_mutation_response$Race instance) =>
        <String, dynamic>{
          'name': instance.name,
        };

InsertRace$mutation_root$Race_mutation_response
    _$InsertRace$mutation_root$Race_mutation_responseFromJson(
        Map<String, dynamic> json) {
  return InsertRace$mutation_root$Race_mutation_response()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : InsertRace$mutation_root$Race_mutation_response$Race.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$InsertRace$mutation_root$Race_mutation_responseToJson(
        InsertRace$mutation_root$Race_mutation_response instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

InsertRace$mutation_root _$InsertRace$mutation_rootFromJson(
    Map<String, dynamic> json) {
  return InsertRace$mutation_root()
    ..insert_Race = json['insert_Race'] == null
        ? null
        : InsertRace$mutation_root$Race_mutation_response.fromJson(
            json['insert_Race'] as Map<String, dynamic>);
}

Map<String, dynamic> _$InsertRace$mutation_rootToJson(
        InsertRace$mutation_root instance) =>
    <String, dynamic>{
      'insert_Race': instance.insert_Race?.toJson(),
    };

InsertRaceArguments _$InsertRaceArgumentsFromJson(Map<String, dynamic> json) {
  return InsertRaceArguments(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    name: json['name'] as String,
    season_id: json['season_id'] as String,
    round: json['round'] as int,
  );
}

Map<String, dynamic> _$InsertRaceArgumentsToJson(
        InsertRaceArguments instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'name': instance.name,
      'season_id': instance.season_id,
      'round': instance.round,
    };
