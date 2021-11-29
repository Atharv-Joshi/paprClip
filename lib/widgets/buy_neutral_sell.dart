import 'package:flutter/material.dart';

class BuyNeutralSell extends StatelessWidget {
  final String? buy;
  final String? neutral;
  final String? sell;
  const BuyNeutralSell({Key? key,  this.buy = '-',  this.neutral = '-',  this.sell = '-'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 12, 0, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children:  [
                Text(
                  buy ?? '-',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
                const Text(
                  'Buy',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children:  [
                Text(
                  neutral ?? '-',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
                const Text(
                  'Neutral',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children:  [
                Text(
                  sell ?? '-',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
                const Text(
                  'Sell',
                  style:  TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
