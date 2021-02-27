import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/screens/city/city.dart';
import 'package:negros_tracker_website/src/screens/home/home_item.dart';
import 'package:negros_tracker_website/src/screens/home/negros_tracker_logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Welcome Banner
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: NegrosTrackerAlt2(),
            ),

            // Welcome Banner
            Container(
              child: StreamBuilder(
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
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              HomeItem(
                                count: positive,
                                color: Color(0xffFBD168),
                                title: 'Overall Positive',
                              ),
                              Container(height: 80, child: VerticalDivider()),
                              HomeItem(
                                count: deaths,
                                color: Colors.redAccent,
                                title: 'Overall Deaths',
                              )
                            ],
                          ),
                          Divider(),
                          HomeItem(
                            count: recoveries,
                            color: Color(0xff37BC9B),
                            title: 'Overall Recoveries',
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              HomeItem(
                                count: pui,
                                color: Colors.grey,
                                title: 'Total PUI',
                              ),
                              Container(height: 80, child: VerticalDivider()),
                              HomeItem(
                                count: pum,
                                color: Colors.grey,
                                title: 'Total PUM',
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  }),
            ),

            // Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // add patient
                Container(
                  child: FlatButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (route) => CityPage()),
                    ),
                    icon: Icon(Icons.add),
                    label: Text('new city figures'.toUpperCase()),
                  ),
                ),

                // add patient
                Container(
                  child: FlatButton.icon(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (route) => CityPage())),
                    icon: Icon(Icons.add),
                    label: Text('new patient case'.toUpperCase()),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
