import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final String column1;
  final String column2;
  final String column3;
  const TableHeader({Key? key, required this.column1, required this.column2, required this.column3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                 Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xff121212),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            column1,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),
          ),
           Text(
            column2,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),
          ),
           Text(
            column3,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),
          ),
        ],
      ),
    );
  }
}
