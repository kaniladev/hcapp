
import 'package:flutter/material.dart';

import 'sql_functions.dart';
import 'templates/templateCH0X_01.dart';
import 'templates/templateCH0X_02.dart';
import 'templates/templateCH0X_03.dart';
import 'templates/templateCH0X_04.dart';
import 'templates/templateCH0X_05.dart';
import 'templates/templateCH0X_06.dart';
import 'templates/templateCH0X_07.dart';
import 'templates/templateCH0X_08.dart';
import 'templates/templateR01.dart';
import 'templates/templateR02.dart';
import 'templates/templateR03.dart';
import 'templates/templateR04.dart';
import 'templates/templateR05.dart';
import 'templates/templateR06.dart';
import 'templates/templateR07.dart';
import 'var.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({Key? key}) : super(key: key);

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {

  void loadAccountsData() async {
    final data = await SQLFunction.getItems();
    setState(() {
      accountsData = data;
      usersData = accountsData[0][usersData[0]['id']];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadAccountsData();
    super.initState();
    print("...number of items ${accountsData.length}");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Image(image: AssetImage("assets/hclogo.png"), height: 50,),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: Builder(
          builder: (context){
            final selectedData = jsonData.isNotEmpty ? jsonData.firstWhere((element) => element['id'] == selectedId) : null;
            if(selectedData == null){
              return const Center(child: Text('Selected data not found'));
            } else if (selectedData['template'] == 'R01'){
              return templateR01(selectedData, context);
            } else if (selectedData['template'] == 'R02'){
              return templateR02(selectedData, context);
            } else if (selectedData['template'] == 'R03'){
              return templateR03(selectedData, context);
            } else if (selectedData['template'] == 'R04'){
              return templateR04(selectedData, context);
            } else if (selectedData['template'] == 'R05'){
              return templateR05(selectedData, context);
            } else if (selectedData['template'] == 'R06'){
              return templateR06(selectedData, context);
            } else if (selectedData['template'] == 'R07'){
              return templateR07(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_01'){
              return templateCH0X_01(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_02'){
              return templateCH0X_02(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_03'){
              return templateCH0X_03(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_04'){
              return templateCH0X_04(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_05'){
              return templateCH0X_05(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_06'){
              return templateCH0X_06(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_07'){
              return templateCH0X_07(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_08'){
              return templateCH0X_08(selectedData, context);
            } else {
              return Center(child: Text("Noooooo"),);
            }
          }),
    );
  }
}
