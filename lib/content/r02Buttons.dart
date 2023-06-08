import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class R02Button extends StatefulWidget {
  dynamic selectedData;
  R02Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R02Button> createState() => _R02ButtonState();
}

class _R02ButtonState extends State<R02Button> {
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
              if(button['text'] == "Confirm"){
              Navigator.pushReplacement(context, routeBT(PageBuilder()));
              }

              if(button['text'] == "Go back"){
                Navigator.pushReplacement(context, routeLR(PageBuilder()));
              }

            },
            child: Text(button['text']),
          );
        }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
      );
  }
}
