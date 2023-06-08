
import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class CH0X_06Button extends StatefulWidget {
  dynamic selectedData;
  CH0X_06Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<CH0X_06Button> createState() => _CH0X_06ButtonState();
}

class _CH0X_06ButtonState extends State<CH0X_06Button> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final button = widget.selectedData['buttons'][0];
              setState(() {
                selectedId  = button['linkto'];
              });
              Navigator.pushReplacement(context, routeRL(PageBuilder()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.selectedData['buttons'][0]['text']),
              ],
            ),
          ),
          InkWell(
              onTap: (){
                final button = widget.selectedData['buttons'][1];
                setState(() {
                  selectedId  = button['linkto'];
                });
                Navigator.pushReplacement(context, routeLR(PageBuilder()));
              },
              child: Text(widget.selectedData['buttons'][1]['text'], style: TextStyle(decoration: TextDecoration.underline),))
        ],
      );
  }
}
