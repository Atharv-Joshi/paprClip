import 'package:flutter/material.dart';

class RecommendedAction extends StatelessWidget {
  final Color bgColor;
  final String action;
  const RecommendedAction({Key? key, required this.bgColor, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 12),
      child:  Text(
        action,
        style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 12
        ),
      ),
    );
  }
}
