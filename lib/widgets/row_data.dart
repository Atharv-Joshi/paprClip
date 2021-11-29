import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  final bool isPivotPointData ;
  final String? column1;
  final String? column3;
  final String? column2;
  const RowData({Key? key, this.column1 = '', this.column2 = '', this.column3 = '', this.isPivotPointData = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
             width: 50,
             child: Text(
              column1 ?? '-',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14
              ),
          ),
           ),
           isPivotPointData == false ? Text(
            column2 ?? '-',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ) : Container(),
           Text(
            column3 ?? '-',
            style: TextStyle(
                color:  isPivotPointData ? Colors.white : column3 == 'Buy' ?  Colors.blue : Colors.red ,
                fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}
