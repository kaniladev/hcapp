
import 'package:flutter/material.dart';

import 'locator.dart';
import 'navigation_service.dart';
import 'navigatorScreen.dart';
import 'routes.dart';
import 'sql_functions.dart';
import 'theme.dart';
import 'var.dart';

class XPage extends StatefulWidget {
  const XPage({Key? key}) : super(key: key);

  @override
  State<XPage> createState() => _XPageState();
}

class _XPageState extends State<XPage> {

  void loadAccountsData() async {
    final data = await SQLFunction.getItems();
    setState(() {
      accountsData = data;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hemayat Christa',
      theme: lightThemeData,
      builder: (context, child) => NavigatorScreen(child: child,),
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/pagebuilder',
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
