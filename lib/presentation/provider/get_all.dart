import 'package:aa_task1/commond/locator/locator.dart';
import 'package:aa_task1/commond/resources/data_state.dart';
import 'package:aa_task1/data_resource/entity.dart';
import 'package:aa_task1/data_resource/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllProvider = FutureProvider<DataState<List<DataEntity>>>((ref) async {
  return await locator<DataRepository>().getAllData();
});
