import 'package:flutter/material.dart';
import 'package:ja_chuiin/screen/map.dart';


class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(onPressed:(){ Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMAP()),
            );},
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 18,
              ),
              label: Text(
                '전체계좌',
                style: TextStyle(fontSize: 9),
              ),
            ),
            TextButton.icon(onPressed:(){},
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 18,
              ),
              label: Text(
                '금융상품',
                style: TextStyle(fontSize: 9),
              ),
            ),
            TextButton.icon(onPressed:(){},
              icon: Icon(
                Icons.pie_chart,
                size: 18,
              ),
              label: Text(
                '자산관리',
                style: TextStyle(fontSize: 9),
              ),
            ),
            TextButton.icon(onPressed:(){},
              icon: Icon(
                Icons.wallet_giftcard,
                size: 18,
              ),
              label: Text(
                '혜택',
                style: TextStyle(fontSize: 9),
              ),
            ),
            TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.credit_card_rounded,
                size: 18,
              ),
              label: Text(
                '카드',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}