import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/fromFlag.dart';
import '../content/pageHeader.dart';
import '../content/pageImage.dart';
import '../content/r05Buttons.dart';

Padding templateR05(Map<String, dynamic> selectedData, BuildContext context) {
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
        FromFlags(),
        const SizedBox(
          height: defaultPadding,
        ),
        R05Button(selectedData: selectedData),
      ],
    ),
  );
}