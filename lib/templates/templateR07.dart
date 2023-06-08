import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/pageContent.dart';
import '../content/pageHeader.dart';
import '../content/r07Buttons.dart';

Padding templateR07(Map<String, dynamic> selectedData, BuildContext context) {
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
              AspectRatio(
                  aspectRatio: 1,
                  child: Center(child: pageContent(selectedData, context))),
              TextField(
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        R07Button(selectedData: selectedData)
      ],
    ),
  );
}