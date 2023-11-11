import 'package:aa_task1/data_resource/local/dao.dart';
import 'package:aa_task1/data_resource/local/data.dart';
import 'package:aa_task1/data_resource/repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
setup() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<DataDao>(database.dataDao);
  locator.registerSingleton<DataRepository>(DataRepository(locator()));
}
