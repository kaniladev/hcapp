import 'package:flutter/material.dart';

import '../constants.dart';
import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../var.dart';

class CH0X_05Button extends StatefulWidget {
  dynamic selectedData;
  CH0X_05Button({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<CH0X_05Button> createState() => _CH0X_05ButtonState();
}

class _CH0X_05ButtonState extends State<CH0X_05Button> {
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
          childAspectRatio: 1),
      itemBuilder: (BuildContext context, int index) {
        final button = widget.selectedData['buttons'][index];
        return InkWell(
          onTap: (){
                setState(() {
                  selectedId  = button['linkto'];
                });
                Navigator.pushReplacement(context, routeRL(PageBuilder()));
          },
          child: Container(
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
          child: Center(child: Text(button['text'], textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),),
        );

        // return ElevatedButton(
        //   onPressed: () {
        //     setState(() {
        //       selectedId  = button['linkto'];
        //     });
        //     Navigator.pushReplacement(context, routeRL(PageBuilder()));
        //   },
        //   child: Text(button['text'],),
        // );

        },);
  }
}
