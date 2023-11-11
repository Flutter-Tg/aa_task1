import 'package:aa_task1/commond/resources/data_state.dart';
import 'package:aa_task1/data_resource/entity.dart';
import 'package:aa_task1/data_resource/local/dao.dart';

class DataRepository {
  DataDao database;
  DataRepository(this.database);

  Future<DataState<List<DataEntity>>> getAllData() async {
    try {
      final datas = await database.getAll();
      return DataSuccess(datas);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState<dynamic>> addData(DataEntity data) async {
    try {
      await database.add(data);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState<dynamic>> removeData(DataEntity data) async {
    try {
      await database.remove(data);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
