
import 'package:flutter/material.dart';

import '../constants.dart';
import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class R03Button extends StatefulWidget {
  dynamic selectedData;
  R03Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R03Button> createState() => _R03ButtonState();
}

class _R03ButtonState extends State<R03Button> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.selectedData['buttons'].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: 3),
      itemBuilder: (BuildContext context, int index) {
        final button = widget.selectedData['buttons'][index];
        return ElevatedButton(
          onPressed: () {

            setState(() {
              selectedId  = button['linkto'];
            });

            Navigator.pushReplacement(context, routeRL(PageBuilder()));
          },
          child: Text(button['text']),
        );},);
  }
}

