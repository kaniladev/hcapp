
import 'package:flutter/material.dart';

Builder pageTitle(Map<String, dynamic> selectedData, BuildContext context) {
  return Builder(
      builder: (context) {
        if(selectedData['title'].toString().length >= 61){
          return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        } else if (selectedData['title'].toString().length >= 21 && selectedData['title'].toString().length <= 60) {
          return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        } else {
          return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
        }
      }
  );
}