import 'package:floor/floor.dart';

import '../entity.dart';

@dao
abstract class DataDao {
  @Query('SELECT * FROM DataEntity')
  Future<List<DataEntity>> getAll();

  @insert
  Future<void> add(DataEntity data);

  @delete
  Future<void> remove(DataEntity data);
}
