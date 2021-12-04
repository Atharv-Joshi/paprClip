import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclip/controllers/option_controller.dart';

class EstTimeButton extends StatelessWidget {
  final String text;
  final String value;

  EstTimeButton({Key? key, required this.text, required this.value}) : super(key: key);

  OptionController optionController = Get.find<OptionController>();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all( RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          )
          )
      ),
      onPressed: (){
        // print('value : $value ');
        optionController.updateEstTime(value);
      },
      child: Text(
        text,
        style:  TextStyle(
            color: Colors.white.withOpacity(0.8)
        ),
      ),
    );
  }
}
