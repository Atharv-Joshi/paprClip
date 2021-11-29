import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclip/controllers/option_controller.dart';
import 'package:paprclip/widgets/bottom_modal_sheet.dart';

class OptionButton extends StatelessWidget {
 final  List<String> optionList;
 final bool isTableData;
 OptionButton({required this.optionList, required this.isTableData});
  OptionController optionController = Get.find<OptionController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: const Color(0xff121212),
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 12),
        child: TextButton(
          onPressed: ()
          {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.transparent,
                builder: (context) => BottomModalSheet(optionList: optionList, isTableData: isTableData,)
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Obx(
                  () => Text(
                    isTableData ?
                    optionController.tableDataOption.value == '' ? optionList[0] : optionController.tableDataOption.value
                    : optionController.pivotPointOption.value == '' ? optionList[0] : optionController.pivotPointOption.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  )
              ),

              const SizedBox(width: 5,),
              Image.asset('assets/down_arrow.png' , scale: 1.2,),
            ],
          ),
        )
    );
  }
}
