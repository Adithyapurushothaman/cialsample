import 'package:drift/drift.dart';

class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text()();
  TextColumn get aadhaar => text().withLength(min: 12, max: 12)();
  TextColumn get mobile => text().withLength(min: 10, max: 10)();
  TextColumn get email => text().nullable()();

  TextColumn get role => text()();
  TextColumn get passCategory => text()();
  TextColumn get location => text()();

  TextColumn get address => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
