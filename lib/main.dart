import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'graphql_api.graphql.dart';

void main() {
  runApp(MutationExample());
}

class MutationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Graphql Mutation demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MutationTrigger(),
        ),
      ),
    );
  }
}

class MutationTrigger extends StatefulWidget {
  @override
  _MutationTriggerState createState() => _MutationTriggerState();
}

class _MutationTriggerState extends State<MutationTrigger> {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  String name;
  int round;
  DateTime raceDate;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter the race name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the name';
              }
              return null;
            },
            onSaved: (value) => name = value,
          ),
          SizedBox(
            height: 10,
          ),
          new TextFormField(
            onSaved: (value) => round = int.parse(value),
            decoration: const InputDecoration(
              hintText: 'Enter the race round',
              labelText: 'Round',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a round';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(
            height: 10,
          ),
          BasicDateTimeField(
            saveDate: (dateTime) => raceDate = dateTime,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: (() async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                InsertRaceArguments arguments = InsertRaceArguments(
                    date: raceDate,
                    round: round,
                    name: name,
                    season_id: 'f8e7d546-7556-4ccf-9615-7186c7d6a113');
                await graphQLConfiguration.client.mutate(MutationOptions(
                    documentNode: InsertRaceMutation().document,
                    variables: arguments.toJson()));
              }
            }),
          ),
        ],
      ),
    );
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final initialValue = DateTime.now();
  final saveDate;

  BasicDateTimeField({Key key, this.saveDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
          format: format,
          initialValue: initialValue,
          validator: (date) => date == null ? 'Invalid date' : null,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          onSaved: saveDate),
    ]);
  }
}

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: 'https://brief-quagga-80.hasura.app/v1/graphql',
  );

  GraphQLClient client = GraphQLClient(
    cache: InMemoryCache(),
    link: httpLink,
  );
}
