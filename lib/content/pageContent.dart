import 'package:flutter/material.dart';

Text pageContent(Map<String, dynamic> selectedData, BuildContext context) {
  return Text(
    selectedData['content'],
    textAlign: TextAlign.center,
    style: Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: Colors.black,),
  );
}