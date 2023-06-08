
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/pageHeader.dart';
import '../content/pageImage.dart';
import '../content/r03Buttons.dart';

Padding templateR03(Map<String, dynamic> selectedData, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              pageHeader(selectedData, context),
              pageImage(selectedData),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        R03Button(selectedData: selectedData),
      ],
    ),
  );
}