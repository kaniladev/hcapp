import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class R04Button extends StatefulWidget {
  dynamic selectedData;
  R04Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R04Button> createState() => _R02ButtonState();
}

class _R02ButtonState extends State<R04Button> {
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
