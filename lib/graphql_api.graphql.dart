// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'coercers.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class InsertRace$mutation_root$Race_mutation_response$Race with EquatableMixin {
  InsertRace$mutation_root$Race_mutation_response$Race();

  factory InsertRace$mutation_root$Race_mutation_response$Race.fromJson(
          Map<String, dynamic> json) =>
      _$InsertRace$mutation_root$Race_mutation_response$RaceFromJson(json);

  String name;

  @override
  List<Object> get props => [name];
  Map<String, dynamic> toJson() =>
      _$InsertRace$mutation_root$Race_mutation_response$RaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InsertRace$mutation_root$Race_mutation_response with EquatableMixin {
  InsertRace$mutation_root$Race_mutation_response();

  factory InsertRace$mutation_root$Race_mutation_response.fromJson(
          Map<String, dynamic> json) =>
      _$InsertRace$mutation_root$Race_mutation_responseFromJson(json);

  List<InsertRace$mutation_root$Race_mutation_response$Race> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$InsertRace$mutation_root$Race_mutation_responseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InsertRace$mutation_root with EquatableMixin {
  InsertRace$mutation_root();

  factory InsertRace$mutation_root.fromJson(Map<String, dynamic> json) =>
      _$InsertRace$mutation_rootFromJson(json);

  InsertRace$mutation_root$Race_mutation_response insert_Race;

  @override
  List<Object> get props => [insert_Race];
  Map<String, dynamic> toJson() => _$InsertRace$mutation_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InsertRaceArguments extends JsonSerializable with EquatableMixin {
  InsertRaceArguments({this.date, this.name, this.season_id, this.round});

  factory InsertRaceArguments.fromJson(Map<String, dynamic> json) =>
      _$InsertRaceArgumentsFromJson(json);

  final DateTime date;

  final String name;

  final String season_id;

  final int round;

  @override
  List<Object> get props => [date, name, season_id, round];
  Map<String, dynamic> toJson() => _$InsertRaceArgumentsToJson(this);
}

class InsertRaceMutation
    extends GraphQLQuery<InsertRace$mutation_root, InsertRaceArguments> {
  InsertRaceMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'InsertRace'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'date')),
              type: NamedTypeNode(
                  name: NameNode(value: 'date'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'season_id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'uuid'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'round')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_Race'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ListValueNode(values: [
                      ObjectValueNode(fields: [
                        ObjectFieldNode(
                            name: NameNode(value: 'date'),
                            value: VariableNode(name: NameNode(value: 'date'))),
                        ObjectFieldNode(
                            name: NameNode(value: 'name'),
                            value: VariableNode(name: NameNode(value: 'name'))),
                        ObjectFieldNode(
                            name: NameNode(value: 'season_id'),
                            value: VariableNode(
                                name: NameNode(value: 'season_id'))),
                        ObjectFieldNode(
                            name: NameNode(value: 'round'),
                            value: VariableNode(name: NameNode(value: 'round')))
                      ])
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'InsertRace';

  @override
  final InsertRaceArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  InsertRace$mutation_root parse(Map<String, dynamic> json) =>
      InsertRace$mutation_root.fromJson(json);
}
