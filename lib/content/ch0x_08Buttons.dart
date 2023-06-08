import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class CH0X_08Button extends StatefulWidget {
  dynamic selectedData;
  CH0X_08Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<CH0X_08Button> createState() => _CH0X_08ButtonState();
}

class _CH0X_08ButtonState extends State<CH0X_08Button> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.selectedData['buttons'].length,
      itemBuilder: (context, index) {
        final button = widget.selectedData['buttons'][index];
        return ElevatedButton(
          onPressed: () {
            setState(() {
              selectedId  = button['linkto'];
            });

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageBuilder()));

          },
          child: Text(button['text']),
        );
      }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
    );
  }
}
