// Created by Christian Gerard E. Hizon on 4/27/20 12:26 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 8:50 AM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'map_pills.dart';

class SharedBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('dev-cases')
            .document('summary')
            .snapshots(),
        builder: (context, snapshot) {
          String deaths = '0';
          String pui = '0';
          String pum = '0';
          String positive = '0';
          String recoveries = '0';

          if (snapshot.hasData && snapshot.data.exists) {
            DocumentSnapshot snap = snapshot.data;
            deaths = snap.data['total_deaths'].toString();
            pui = snap.data['total_pui'].toString();
            pum = snap.data['total_pum'].toString();
            positive = snap.data['total_positive'].toString();
            recoveries = snap.data['total_recoveries'].toString();
          }

          return Container(
            width: 800,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
              children: <Widget>[
                /*

                Pills

               */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: MapPills(
                        color: Color(0xffFBD168),
                        count: positive,
                        title: 'Positive',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: MapPills(
                        color: Color(0xff37BC9B),
                        count: recoveries,
                        title: 'Recoveries',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                /*

                Stats


               */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '$deaths Deaths',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$pui PUIs',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$pum PUMs',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
