import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclip/controllers/option_controller.dart';
import 'package:paprclip/widgets/row_data.dart';

class PivotPointTable extends StatelessWidget {
  final Map serverData;
   PivotPointTable({Key? key, required this.serverData}) : super(key: key);
  List<Widget> pivotRows = [];
  OptionController optionController = Get.find<OptionController>();

  @override
  Widget build(BuildContext context) {
    for (dynamic key in serverData[optionController.estTime.value]['pivot_points'][optionController.pivotPointOption.value].keys){
      pivotRows.add(
        Obx(
            () => RowData(
              isPivotPointData: true,
              column3: serverData[optionController.estTime.value]['pivot_points'][optionController.pivotPointOption.value][key],
              column1: key,
            )
        ),

      );
    }
    return Container(
      child: Column(
        children: pivotRows,
      ),
    );
  }
}
