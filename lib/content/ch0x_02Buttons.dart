import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class CH0X_02Button extends StatefulWidget {
  dynamic selectedData;
  CH0X_02Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<CH0X_02Button> createState() => _CH0X_02ButtonState();
}

class _CH0X_02ButtonState extends State<CH0X_02Button> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              final button = widget.selectedData['buttons'][0];

              setState(() {
                selectedId  = button['linkto'];
              });

              Navigator.pushReplacement(context, routeLR(PageBuilder()));

            }, icon: Icon(Icons.arrow_back_ios_sharp)),
            IconButton(onPressed: (){
              final button = widget.selectedData['buttons'][1];

              setState(() {
                selectedId  = button['linkto'];
              });

              Navigator.pushReplacement(context, routeRL(PageBuilder()));

            }, icon: Icon(Icons.arrow_forward_ios_sharp)),
          ],
        ),
      ],
    );
  }
}
