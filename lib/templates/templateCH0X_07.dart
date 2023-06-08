
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/ch0x_07Buttons.dart';
import '../content/pageContent.dart';
import '../content/pageHeader.dart';
import '../content/pageImage.dart';

Padding templateCH0X_07(Map<String, dynamic> selectedData, BuildContext context) {
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
              pageContent(selectedData, context),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        CH0X_07Button(selectedData: selectedData)
      ],
    ),
  );
}