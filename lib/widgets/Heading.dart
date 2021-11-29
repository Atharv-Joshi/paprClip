import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(
          child: Text(
            'USD/INR',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 21
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
