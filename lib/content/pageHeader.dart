
import 'package:flutter/material.dart';

Builder pageHeader(Map<String, dynamic> selectedData, BuildContext context) {
  return Builder(
      builder: (context) {
        if(selectedData['header'].toString().length >= 61){
          return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        } else if (selectedData['header'].toString().length >= 21 && selectedData['header'].toString().length <= 60) {
          return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        } else {
          return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        }
      }
  );
}