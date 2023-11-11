import 'package:aa_task1/commond/locator/locator.dart';
import 'package:aa_task1/commond/resources/data_state.dart';
import 'package:aa_task1/data_resource/entity.dart';
import 'package:aa_task1/data_resource/repository.dart';
import 'package:aa_task1/presentation/provider/get_all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addDataProvider =
    FutureProvider.family<DataState<dynamic>, DataEntity>((ref, data) async {
  final dataState = await locator<DataRepository>().addData(data);

  if (dataState is DataSuccess) {
    // ignore: unused_result
    ref.refresh(getAllProvider.future);
  }
  return dataState;
});
