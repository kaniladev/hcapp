import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  final child;
  NavigatorScreen({Key? key, required this.child,}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage("assets/hclogo.png"), height: 50,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: widget.child,
    );
  }
}