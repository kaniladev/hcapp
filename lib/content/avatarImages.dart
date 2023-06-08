
import 'package:flutter/material.dart';

import '../constants.dart';

GridView avatarImages(Map<String, dynamic> selectedData) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: selectedData['image'].length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: 1
    ),
    itemBuilder: (BuildContext context, int index) {
      final photo = selectedData['image'][index];
      return Image(image: AssetImage(photo["image"]));},);
}