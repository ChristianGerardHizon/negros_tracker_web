import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/utils/image_assets.dart';

class NegrosTrackerAlt2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImageAssets.logo,
                  scale: 4,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Negros',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tracker',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor),
              )
            ],
          ),
          SizedBox(width: 5),
          Text(
            'by Stratium Software Group',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
