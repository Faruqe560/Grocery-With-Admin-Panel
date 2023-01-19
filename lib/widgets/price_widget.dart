import 'package:flutter/material.dart';

import 'package:fshop2/services/utils.dart';
import 'package:fshop2/widgets/text_widgets.dart';

class PriceWidget extends StatelessWidget {
  final double salePrice;
  final double price;
  final String textPrice;
  final bool isOnSale;
  const PriceWidget({
    Key? key,
    required this.salePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Color.fromARGB(255, 235, 136, 15),
            textSize: 17,
            isTitle: true,
          ),
          SizedBox(
            width: 5.0,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "\$${(price * int.parse(textPrice)).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 13, color: color),
            ),
          )
        ],
      ),
    );
  }
}
