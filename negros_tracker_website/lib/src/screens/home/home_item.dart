import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeItem extends StatelessWidget {
  final Color color;
  final String title;
  final String count;

  const HomeItem({Key key, this.color, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              this.count,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            this.title,
            style: TextStyle(
              color: color,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
