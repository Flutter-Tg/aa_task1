import 'package:floor/floor.dart';

@entity
class DataEntity {
  @primaryKey
  final int? id;
  final String name;

  DataEntity({this.id, required this.name});
}
