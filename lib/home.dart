import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:paprclip/services/api_calls.dart';
import 'package:paprclip/widgets/Heading.dart';
import 'package:paprclip/widgets/buy_neutral_sell.dart';
import 'package:paprclip/widgets/option_button.dart';
import 'package:paprclip/widgets/pivot_point_table.dart';
import 'package:paprclip/widgets/recommended_action.dart';
import 'package:paprclip/widgets/row_data.dart';
import 'package:paprclip/widgets/select_est_time_section.dart';
import 'package:paprclip/widgets/sub_heading.dart';
import 'package:paprclip/widgets/table_header.dart';

import 'controllers/option_controller.dart';

class Home extends StatelessWidget {

  OptionController optionController = Get.put(OptionController());
  ApiCalls apiCalls = ApiCalls();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: apiCalls.getDataFromServer(),
          builder: (BuildContext context, AsyncSnapshot snapshot)
          {
            if(snapshot.hasData){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                height: double.infinity,
                width: double.infinity,
                color: const Color(0xff000000),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                      const Heading(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 18, 0, 38),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.91,
                        color: const Color(0xff121212),
                      ),
                      const SubHeading(text: 'Summary'),
                      SelectEstimatedTimeSection(),
                      const SubHeading(text: 'Moving Averages'),
                      Obx(
                          () => RecommendedAction(bgColor: Colors.blueAccent, action: snapshot.data[optionController.estTime.value]['moving_averages']['text']),
                      ),
                      Obx(
                          () =>  BuyNeutralSell(
                            buy: snapshot.data[optionController.estTime.value]['moving_averages']['buy'],
                            neutral: snapshot.data[optionController.estTime.value]['moving_averages']['neutral'],
                            sell: snapshot.data[optionController.estTime.value]['moving_averages']['sell'],
                          )
                      ),

                      OptionButton(optionList: ['simple', 'exponential'], isTableData: true,),
                      const TableHeader(
                        column1: 'Period',
                        column2: 'Value',
                        column3: 'Type',
                      ),
                      Obx(
                          () => Column(
                            children: snapshot.data[optionController.estTime.value]['moving_averages']['table_data'][optionController.tableDataOption].map<Widget>(
                                    (e) => RowData(
                                  column3: e['type'],
                                  column1: e['title'],
                                  column2: e['value'],
                                )
                            ).toList(),
                          )
                      ),
                      const SubHeading(text: 'Oscillators'),
                      Obx(
                          () =>
                              RecommendedAction(bgColor: Color(0xffFF2E50), action: snapshot.data[optionController.estTime.value]['technical_indicator']['text'])
                      ),
                      Obx(
                          () => BuyNeutralSell(
                            buy: snapshot.data[optionController.estTime.value]['technical_indicator']['buy'],
                            neutral: snapshot.data[optionController.estTime.value]['technical_indicator']['neutral'],
                            sell: snapshot.data[optionController.estTime.value]['technical_indicator']['sell'],
                          )
                      ),

                      TableHeader(
                        column1: 'Name',
                        column2: 'Value',
                        column3: 'Action',
                      ),
                      Obx(
                          () => Column(
                            children: snapshot.data[optionController.estTime.value]['technical_indicator']['table_data'].map<Widget>(
                                    (e) => RowData(
                                  column3: e['action'],
                                  column1: e['name'],
                                  column2: e['value'],
                                )
                            ).toList(),
                          ),
                      ),

                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 45, 0, 30),
                          child: const SubHeading(text: 'Pivot Points',)
                      ),
                      OptionButton(optionList: ['classic', 'demark', 'fibonacci', 'camarilla', 'woodie'], isTableData: false,),
                      PivotPointTable(serverData: snapshot.data,),
                    ],
                  ),
                ),
              );
            }

            return Container(
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xff121212),
                child: const Center(child: CircularProgressIndicator(color: Colors.white,))
            );

          }
        ),
      ),
    );
  }
}
