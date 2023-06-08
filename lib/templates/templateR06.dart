import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/avatarImages.dart';
import '../content/pageHeader.dart';
import '../content/r06Buttons.dart';

Padding templateR06(Map<String, dynamic> selectedData, BuildContext context) {
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
              avatarImages(selectedData),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        R06Button(selectedData: selectedData)
      ],
    ),
  );
}