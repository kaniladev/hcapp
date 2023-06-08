
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/ch0x_03Buttons.dart';
import '../content/pageContent.dart';
import '../content/pageHeader.dart';

Stack templateCH0X_03(Map<String, dynamic> selectedData, BuildContext context) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView(
          children: [
            pageHeader(selectedData, context),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
      CH0X_03Button(selectedData: selectedData)
    ],
  );
}