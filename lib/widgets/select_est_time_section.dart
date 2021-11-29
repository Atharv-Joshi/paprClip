import 'package:flutter/material.dart';

import 'est_time_button.dart';

class SelectEstimatedTimeSection extends StatefulWidget {
  const SelectEstimatedTimeSection({Key? key}) : super(key: key);

  @override
  _SelectEstimatedTimeSectionState createState() => _SelectEstimatedTimeSectionState();
}

class _SelectEstimatedTimeSectionState extends State<SelectEstimatedTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              EstTimeButton(text: '1 MIN', value: '1min',),
              EstTimeButton(text: '5 MIN', value: '5min',),
              EstTimeButton(text: '15 MIN', value: '15min',),
              EstTimeButton(text: '30 MIN', value: '30min',),
              EstTimeButton(text: '1 HR', value: '1hour',),
              EstTimeButton(text: '5 HR', value: '5hour',),
              EstTimeButton(text: '1 DAY', value: 'daily',),
              EstTimeButton(text: '1 WK', value: 'weekly',),
              EstTimeButton(text: '1 MON', value: 'monthly',),
            ],
          ),
        ],
      ),
    );
  }
}
