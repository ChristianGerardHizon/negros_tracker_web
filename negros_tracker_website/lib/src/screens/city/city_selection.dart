import 'package:flutter/material.dart';
import 'package:negros_tracker_website/src/screens/city/city_dropdown.dart';

class CitySelection extends StatefulWidget {
  final Function(String) onCitySelect;

  const CitySelection({Key key, this.onCitySelect}) : super(key: key);

  @override
  _CitySelectionState createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  String selectedCity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Select a city before you proceed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: CityDropdown(
                onSelect: (city) {
                  setState(() {
                    selectedCity = city;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  this.widget.onCitySelect(selectedCity);
                },
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
