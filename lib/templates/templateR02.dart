
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/pageContent.dart';
import '../content/pageImage.dart';
import '../content/pageTitle.dart';
import '../content/r02Buttons.dart';

Padding templateR02(Map<String, dynamic> selectedData, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              pageTitle(selectedData, context),
              pageImage(selectedData),
              pageContent(selectedData, context),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        R02Button(selectedData: selectedData),
      ],
    ),
  );
}