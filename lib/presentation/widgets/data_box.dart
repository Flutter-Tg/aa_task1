import 'package:aa_task1/data_resource/entity.dart';
import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  const DataBox({super.key, required this.data, this.action});
  final DataEntity data;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(data.name),
          const Spacer(),
          if (action != null) action!,
        ],
      ),
    );
  }
}
