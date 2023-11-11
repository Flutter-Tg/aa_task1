import 'package:aa_task1/commond/resources/data_state.dart';
import 'package:aa_task1/commond/widgets/primary_button_widget.dart';
import 'package:aa_task1/presentation/provider/get_all.dart';
import 'package:aa_task1/presentation/provider/remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/data_box.dart';

class RemoveScreen extends ConsumerWidget {
  const RemoveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getAllProvider);
    if (data.isLoading || data.isReloading) {
      return const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (data.hasValue) {
      if (data.value! is DataSuccess && data.value!.data!.isEmpty) {
        return const Center(child: Text('داده ای در حافظه موجود نیست'));
      }
      if (data.value! is DataSuccess) {
        final list = data.value!.data!;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => DataBox(
            data: list[index],
            action: PrimaryButtonWidget(
              text: 'حذف',
              width: 50,
              height: 30,
              radius: 8,
              async: true,
              function: () async {
                await ref.read(removeDataProvider(list[index]).future);
              },
            ),
          ),
        );
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: PrimaryButtonWidget(
          text: 'مشکلی پیش امده، دوباره تلاش کنید',
          async: true,
          function: () async => await ref.refresh(getAllProvider.future),
        ),
      ),
    );
  }
}
