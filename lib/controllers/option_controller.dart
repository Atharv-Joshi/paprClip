
import 'package:get/get.dart';

class OptionController extends GetxController{
  RxString tableDataOption = 'simple'.obs;
  RxString pivotPointOption = 'classic'.obs;
  RxString estTime = '1min'.obs;
  RxMap serverData = {}.obs;

  updateTableDataOption(String value){
    tableDataOption.value = value;
  }

  updatePivotPointOption(String value){
    pivotPointOption.value = value;
  }

  updateEstTime(String value){
    estTime.value = value;
  }

  updateData(Map data){
    serverData.value = data;
  }
}