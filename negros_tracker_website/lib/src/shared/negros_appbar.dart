import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/utils/image_assets.dart';

class NegrosAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              ImageAssets.logo,
              scale: 5,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Negros',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Tracker',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
