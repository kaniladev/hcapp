import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class R05Button extends StatefulWidget {
  dynamic selectedData;
  R05Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R05Button> createState() => _R05ButtonState();
}

class _R05ButtonState extends State<R05Button> {
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
              Navigator.pushReplacement(context, routeBT(PageBuilder()));}

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
