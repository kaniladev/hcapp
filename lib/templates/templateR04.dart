
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/pageHeader.dart';
import '../content/pageImage.dart';
import '../content/r04Buttons.dart';

Padding templateR04(Map<String, dynamic> selectedData, BuildContext context) {
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
        R04Button(selectedData: selectedData)
      ],
    ),
  );
}