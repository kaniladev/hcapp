
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/pageContent.dart';
import '../content/pageTitle.dart';
import '../content/r01Buttons.dart';

Padding templateR01(Map<String, dynamic> selectedData, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView(
              children: [
                pageTitle(selectedData, context),
                pageContent(selectedData, context),
              ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        R01Buttons(selectedData: selectedData),
      ],
    ),
  );
}