// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../entity.dart';
import 'dao.dart';

part 'data.g.dart'; // the generated code will be there

@Database(version: 1, entities: [DataEntity])
abstract class AppDatabase extends FloorDatabase {
  DataDao get dataDao;
}
