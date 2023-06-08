
import 'package:flutter/material.dart';

import '../constants.dart';
import '../content/ch0x_02Buttons.dart';
import '../content/pageContent.dart';
import '../content/pageHeader.dart';
import '../content/pageImage.dart';

Stack templateCH0X_02(Map<String, dynamic> selectedData, BuildContext context) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView(
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
      CH0X_02Button(selectedData: selectedData)
    ],
  );
}