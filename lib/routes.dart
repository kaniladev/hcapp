
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'pageBuilder.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch (setting.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/pagebuilder':
        return MaterialPageRoute(builder: (_) => PageBuilder());
    default:
        return MaterialPageRoute(builder: (_) {
          return Center(
            child: Text("Error Page!"),
          );
        });
    }
  }
}
