import 'package:flutter/material.dart';
import 'frame1.dart';
import 'locator.dart';
import 'navigation_service.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Hemayat Christa',
        theme: lightThemeData,
      home: const Frame1(),
      // builder: (context, child) => NavigatorScreen(child: child,),
      // onGenerateRoute: (settings) => Routes.generateRoute(settings),
      // initialRoute: '/',
      // navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}