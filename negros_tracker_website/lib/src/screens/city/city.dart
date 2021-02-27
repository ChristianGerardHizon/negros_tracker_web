import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/screens/city/city_content.dart';
import 'package:negros_tracker_website/src/screens/city/city_selection.dart';
import 'package:negros_tracker_website/src/shared/shared_bottom_appbar.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String selectedCity;

  @override
  Widget build(BuildContext context) {
    _buildContent() {
      debugPrint(selectedCity);
      if (selectedCity == null) {
        return CitySelection(onCitySelect: (city) {
          selectedCity = city;
          setState(() {});
        });
      } else {
        return CityContent(
          city: selectedCity,
        );
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        // hides app bar when on dashboard
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            // here the desired height
            child: SharedBottomAppBar(),
          ),
          centerTitle: true,
          title: Text(
            'Negros Occidental',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: _buildContent(),
    );
  }
}
