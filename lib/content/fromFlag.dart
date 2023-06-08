import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FromFlags extends StatefulWidget {
  const FromFlags({Key? key}) : super(key: key);

  @override
  State<FromFlags> createState() => _FromFlagsState();
}

class _FromFlagsState extends State<FromFlags> {

  CountryItem? _selectedItem;  // Declare _selectedItem as nullable.

  Future<List<CountryItem>> fetchCountryItems() async {
    String jsonString = await rootBundle.loadString('assets/registration/flags.json');
    List<dynamic> jsonResponse = jsonDecode(jsonString);
    return jsonResponse.map((item) => CountryItem.fromJson(item)).toList();
  }


  @override
  void initState() {
    super.initState();
    _selectedItem = null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryItem>>(
      future: fetchCountryItems(),
      builder: (BuildContext context, AsyncSnapshot<List<CountryItem>> snapshot) {
        if (snapshot.hasData) {
          return DropdownButton<CountryItem>(
            value: _selectedItem,
            hint: Text("Select a Country"), // This will be shown if _selectedItem is null
            onChanged: (CountryItem? newValue) {
              if (newValue != null) {  // Check if newValue is not null before assigning.
                setState(() {
                  _selectedItem = newValue;
                });
              }
            },
            items: snapshot.data!.map<DropdownMenuItem<CountryItem>>((CountryItem value) {
              return DropdownMenuItem<CountryItem>(
                value: value,
                child: Row(
                  children: <Widget>[
                    Image.asset(value.image, width: 25, height: 25),
                    SizedBox(width: 10),
                    Text(value.countryName),
                  ],
                ),
              );
            }).toList(),
          );

        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class CountryItem {
  final String countryName;
  final String image;

  CountryItem({required this.countryName, required this.image});

  factory CountryItem.fromJson(Map<String, dynamic> json) {
    return CountryItem(
      countryName: json['countryName'],
      image: json['image'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CountryItem &&
              runtimeType == other.runtimeType &&
              countryName == other.countryName &&
              image == other.image;

  @override
  int get hashCode => countryName.hashCode ^ image.hashCode;
}
