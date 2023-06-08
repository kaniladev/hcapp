import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class R07Button extends StatefulWidget {
  dynamic selectedData;
  R07Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R07Button> createState() => _R07ButtonState();
}

class _R07ButtonState extends State<R07Button> {
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
              if(button['text'] == "Proceed to Chapter 1"){
              Navigator.pushReplacement(context, routeBT(PageBuilder()));}

              if(button['text'] == "Back to Home Screen"){
                Navigator.pushReplacement(context, routeLR(PageBuilder()));
              }

            },
            child: Text(button['text']),
          );
        }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
      );
  }
}
