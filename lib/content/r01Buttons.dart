
import 'package:flutter/material.dart';

import '../pageBuilder.dart';
import '../pageRoute.dart';
import '../sql_functions.dart';
import '../var.dart';

class R01Buttons extends StatefulWidget {
  dynamic selectedData;
  R01Buttons({Key? key, required this.selectedData}) : super(key: key);

  @override
  State<R01Buttons> createState() => _R01ButtonsState();
}

class _R01ButtonsState extends State<R01Buttons> {

  void loadAccountsData() async {
    final data = await SQLFunction.getItems();
    setState(() {
      accountsData = data;
    });
  }

  Future<void> _updateItem(int id) async {
    await SQLFunction.updateItem(id, 'pageId', selectedId);
    loadAccountsData();
    print("...number of items ${accountsData.length}");
  }

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

              _updateItem(usersData[0]['id']);

              Navigator.pushReplacement(context, routeRL(PageBuilder()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.selectedData['buttons'][0]['text']),
                SizedBox(width: 5,),
                Icon(Icons.arrow_circle_right_rounded)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    final button = widget.selectedData['buttons'][1];
                    setState(() {
                      selectedId  = button['linkto'];
                    });},
                  icon: Icon(Icons.arrow_circle_left)),
              InkWell(
                  onTap: (){
                    final button = widget.selectedData['buttons'][1];
                    setState(() {
                      selectedId  = button['linkto'];
                    });
                  },
                  child: Text(widget.selectedData['buttons'][1]['text'], style: TextStyle(decoration: TextDecoration.underline),)),
            ],
          )
        ],
      );
  }
}
