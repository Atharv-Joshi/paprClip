import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  final bool isPivotPointData ;
  final String? column1;
  final String? column3;
  final String? column2;
  Color? column3Color;
  RowData({Key? key, this.column1 = '', this.column2 = '', this.column3 = '', this.isPivotPointData = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(column3){
      case 'Buy' : {
        column3Color = Colors.blue;
      }
      break;
      case 'Sell' : {
        column3Color = Colors.deepOrange;
      }
      break;
      case 'Neutral' : {
        column3Color = const Color(0xffFFB946);
      }
      break;
      case 'Overbought' : {
        column3Color = Colors.red;
      }
      break;
      case 'Less Volatility' : {
        column3Color = Colors.grey;
      }
      break;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
             width: isPivotPointData ? 100 : 70,
             // color: Colors.green,
             child: Text(
              column1 ?? '-',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14
              ),
          ),
           ),
           isPivotPointData == false ?  Container(
             // color: Colors.red,
             width: 70,
             // margin: EdgeInsets.only(left: 80),
             child: Text(
              column2 ?? '-',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14
              ),
          ),
           ) : Container(),
           Container(
             // margin:  isPivotPointData? const EdgeInsets.only(left: 80) : const EdgeInsets.only(left: 30),
             width:  80,
             // color: Colors.yellow,
             child: Text(
              column3 ?? '-',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color:  isPivotPointData ? Colors.white : column3Color,
                  fontSize: 14
              ),
          ),
           ),
        ],
      ),
    );
  }
}
