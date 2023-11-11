import 'package:aa_task1/commond/resources/data_state.dart';
import 'package:aa_task1/commond/widgets/primary_button_widget.dart';
import 'package:aa_task1/data_resource/entity.dart';
import 'package:aa_task1/presentation/provider/add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/get_all.dart';
import '../widgets/data_box.dart';

class AddScreen extends ConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getAllProvider);
    final list = data.value?.data;

    return Stack(
      children: [
        if (data.isLoading || data.isReloading)
          const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        if (data.hasValue) ...[
          if (data.value! is DataSuccess && data.value!.data!.isEmpty)
            const Center(child: Text('داده ای در حافظه موجود نیست')),
          if (data.value! is DataSuccess)
            ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) => DataBox(data: list[index]),
            ),
        ],
        Positioned(
          right: 20,
          bottom: 20,
          child: PrimaryButtonWidget(
            text: '+',
            width: 50,
            height: 50,
            radius: 8,
            async: true,
            function: () async {
              await ref.read(
                  addDataProvider(DataEntity(name: UniqueKey().toString()))
                      .future);
            },
          ),
        )
      ],
    );
  }
}
