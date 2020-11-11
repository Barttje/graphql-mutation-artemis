import 'package:intl/intl.dart';

final dateFormatter = DateFormat('yyyy-MM-dd');
final timeFormatter = DateFormat('HH:mm:ss');

DateTime fromGraphQLDateToDartDateTime(String date) => DateTime.parse(date);
String fromDartDateTimeToGraphQLDate(DateTime date) =>
    dateFormatter.format(date);

String fromGraphQLUuidToDartString(String uuid) => uuid;
String fromDartStringToGraphQLUuid(String uuid) => uuid;
