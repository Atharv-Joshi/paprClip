import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclip/controllers/option_controller.dart';

import 'est_time_button.dart';

class SelectEstimatedTimeSection extends StatefulWidget {
  final String action;
  const SelectEstimatedTimeSection({Key? key, required this.action}) : super(key: key);

  @override
  _SelectEstimatedTimeSectionState createState() => _SelectEstimatedTimeSectionState();
}

class _SelectEstimatedTimeSectionState extends State<SelectEstimatedTimeSection> {
  double upPosition = 100;
  List<double> containerWidths = [8,8,8,8,8];
  Color tileColor = Colors.blue;
  OptionController optionController = Get.find<OptionController>();
  @override
  Widget build(BuildContext context) {
    switch(widget.action){
      case 'Strong Buy':{
        setState(() {
          upPosition = 20;
          tileColor = const Color(0xff007AFF);
          containerWidths = [8,8,8,8,8];
          containerWidths[0] = 10;
        });
      }
      break;
      case 'Buy':{
        setState(() {
          upPosition = 80;
          tileColor = const Color(0xff007AFF).withOpacity(0.6);
          containerWidths = [8,8,8,8,8];
          containerWidths[1] = 10;
        });
      }
      break;
      case 'Neutral':{
        setState(() {
          upPosition = 140;
          tileColor = const Color(0xffFFB946);
          containerWidths = [8,8,8,8,8];
          containerWidths[2] = 10;
        });
      }
      break;
      case 'Sell':{
        setState(() {
          upPosition = 200;
          tileColor = const Color(0xffFF2E50).withOpacity(0.6);
          containerWidths = [8,8,8,8,8];
          containerWidths[3] = 10;
        });
      }
      break;
      case 'Strong Sell':{
        setState(() {
          upPosition = 260;
          tileColor =  const Color(0xffFF2E50);
          containerWidths = [8,8,8,8,8];
          containerWidths[4] = 10;
        });
      }
      break;
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                AnimatedContainer(
                  decoration: const BoxDecoration(
                      color: Color(0xff007AFF),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5) , topRight: Radius.circular(5))
                  ),
                  width: containerWidths[0],
                    height: 60,
                  duration: Duration(milliseconds: 500),

                ),
                AnimatedContainer(
                  width: containerWidths[1],
                  height: 60,
                  color: const Color(0xff007AFF).withOpacity(0.6),
                  duration: Duration(milliseconds: 500),
                ),
                AnimatedContainer(
                  width: containerWidths[2],
                  height: 60,
                  color: const Color(0xffFFB946),
                  duration: Duration(milliseconds: 500),
                ),
                AnimatedContainer(
                  width: containerWidths[3],
                  height: 60,
                  color: const Color(0xffFF2E50).withOpacity(0.6),
                  duration: Duration(milliseconds: 500),
                ),
                AnimatedContainer(
                  decoration: const BoxDecoration(
                    color: Color(0xffFF2E50),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5) , bottomRight: Radius.circular(5))
                  ),
                  width: containerWidths[4],
                  duration: Duration(milliseconds: 500),
                  height: 60,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            width: 100,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0,
                  // visible:  false,
                  child: TextButton(
                      onPressed: (){

                      }, child:  Text('press me')
                  ),
                ),
                AnimatedPositioned(
                    top: upPosition,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: tileColor,
                      ),
                      width: 100,
                      padding: const EdgeInsets.all(10),

                      child:  Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.action,
                          style: const TextStyle(
                              color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    duration: const Duration(milliseconds: 500 )),

              ],
            ),
          ),

          Container(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
