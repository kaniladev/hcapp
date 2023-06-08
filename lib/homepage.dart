import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pageBuilder.dart';
import 'pageRoute.dart';
import 'var.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/hemayatchrista.json');
    final jsonResult = json.decode(data);
    jsonData = List<Map<String, dynamic>>.from(jsonResult);
  }

  Future<void> loadFlag() async {
    final data = await rootBundle.loadString('assets/registration/flags.json');
    final jsonResult = json.decode(data);
    flagList = List<Map<String, dynamic>>.from(jsonResult);
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadFlag();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Home Page", textAlign: TextAlign.center,),
            InkWell(
            onTap: (){
              // Navigator.push(context, routeBT(PageBuilder()));
              Navigator.push(context, routeBT(PageBuilder()));
            },
            child: Text("Continue", textAlign: TextAlign.center, style: TextStyle(color: Colors.orange),)),
          ],
        ),
      ),
    );
  }
}
