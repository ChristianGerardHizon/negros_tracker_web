/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:07 PM
 ******************************************************************************/

import 'package:flutter/material.dart';

class MapPills extends StatelessWidget {
  final Color color;
  final String count;
  final String title;

  const MapPills({Key key, this.color, this.count, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        border: Border.all(color: color),
        borderRadius: new BorderRadius.all(
          const Radius.circular(8.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                this.count,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            decoration: new BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: new BorderRadius.only(
                topRight: const Radius.circular(6.0),
                bottomRight: const Radius.circular(6.0),
              ),
            ),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
