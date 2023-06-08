import 'package:flutter/material.dart';

AspectRatio pageImage(Map<String, dynamic> selectedData) {
  return AspectRatio(
      aspectRatio: 1/1,
      child: Image(image: (AssetImage(selectedData['image']))));
}