import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CityContent extends StatefulWidget {
  final String city;

  const CityContent({Key key, this.city}) : super(key: key);

  @override
  _CityContentState createState() => _CityContentState();
}

class _CityContentState extends State<CityContent> {
  final _puiController = TextEditingController();
  final _pumController = TextEditingController();
  final _positiveController = TextEditingController();
  final _recoveriesController = TextEditingController();
  final _deathsController = TextEditingController();
  final _sourceController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    Future<Null> _selectDate() async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    _onSubmit() async {
      if (_formKey.currentState.validate()) {
        setState(() {
          isSending = true;
        });
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        int pui = int.parse(_puiController.text);
        int pum = int.parse(_pumController.text);
        int positive = int.parse(_positiveController.text);
        int recoveries = int.parse(_recoveriesController.text);
        int deaths = int.parse(_deathsController.text);
        String source = _sourceController.text;
        String date = DateFormat('yyyy-MM-dd').format(selectedDate);

        String formattedCity =
            widget.city.replaceAll('.', '').replaceAll(' ', '-').toLowerCase();
        var map = {
          'total_pui': pui,
          'total_pum': pum,
          'total_positive': positive,
          'total_recoveries': recoveries,
          'total_deaths': deaths,
          'source': source,
          'last_updated': new DateTime.now(),
        };

        var doc = Firestore.instance
            .collection('dev-cases')
            .document(date)
            .collection('city-breakdown')
            .document(formattedCity);

        await doc.setData(map, merge: true);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Update Success'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ));

        _puiController.clear();
        _pumController.clear();
        _positiveController.clear();
        _recoveriesController.clear();
        _deathsController.clear();
        _sourceController.clear();

        setState(() {
          isSending = false;
        });
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Please check fields.')));
      }
    }

    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('${this.widget.city}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 1.2,
                      )),
                ),
                SizedBox(width: 50),
                Divider(),
                SizedBox(width: 100),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                          'Date : ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          )),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onPressed: isSending ? null : _selectDate,
                        child: Text('Change'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  enabled: !isSending,
                  controller: _puiController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(labelText: 'PUI'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  enabled: !isSending,
                  controller: _pumController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'PUM',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  enabled: !isSending,

                  controller: _recoveriesController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(labelText: 'Recoveries'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  enabled: !isSending,

                  controller: _deathsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(labelText: 'Deaths'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  enabled: !isSending,

                  controller: _positiveController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(labelText: 'Positive'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  enabled: !isSending,

                  controller: _sourceController,
                  decoration: InputDecoration(labelText: 'Source'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  child: FlatButton(
                    onPressed: isSending ? null : _onSubmit,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: isSending
                        ? Container(
                            width: 30,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Submit',
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
        ),
      ),
    );
  }
}
