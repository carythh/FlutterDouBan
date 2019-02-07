import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final stars;
  final size;
  final fontSize;
  final color = Color.fromARGB(255, 255, 170, 71);

  RatingBar(this.stars, {Key key, this.size = 18.0, this.fontSize = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    //实心星星
    var startNumber = stars ~/ 2;
    //半实心星星
    var startHalf = 0;
    if (stars.toString().contains('.')) {
      int tmp = int.parse((stars.toString().split('.')[1]));
      if (tmp >= 5) {
        startHalf = 1;
      }
    }
    //空心星星
    var startEmpty = 5 - startNumber - startHalf;

    for (var i = 0; i < startNumber; i++) {
      startList.add(Icon(
        Icons.star,
        color: color,
        size: size,
      ));
    }
    if (startHalf > 0) {
      startList.add(Icon(
        Icons.star_half,
        color: color,
        size: size,
      ));
    }
    for (var i = 0; i < startEmpty; i++) {
      startList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: size,
      ));
    }
    startList.add(Text(
      '$stars',
      style: TextStyle(color: Colors.grey, fontSize: fontSize),
    ));
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 5),
      child: Row(
        children: startList,
      ),
    );
  }
}