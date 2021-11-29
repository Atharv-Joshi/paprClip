import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclip/controllers/option_controller.dart';

class BottomModalSheet extends StatelessWidget {
  final List<String> optionList;
  final bool isTableData;
  BottomModalSheet({Key? key, required this.optionList, required this.isTableData}) : super(key: key);
  OptionController optionController = Get.find<OptionController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff232323),
        borderRadius: BorderRadius.circular(20)
      ),
      height: MediaQuery.of(context).size.height * 0.3,

      child: ListView(
        children: optionList.map((e) => Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 40, 0),
          child: TextButton(
            onPressed: (){
              isTableData == true ? optionController.updateTableDataOption(e) : optionController.updatePivotPointOption(e);
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                e,
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}
