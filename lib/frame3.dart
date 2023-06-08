import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pageRoute.dart';
import 'var.dart';
import 'x.dart';

class Frame3 extends StatefulWidget {
  const Frame3({Key? key}) : super(key: key);

  @override
  State<Frame3> createState() => _Frame3State();
}

class _Frame3State extends State<Frame3> {

  TextEditingController _passwordCon = TextEditingController();

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 120,),
                Text(
                  "Welcome Back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 25,),
                CircleAvatar(radius: 60, child: Image(image: AssetImage(accountsData[0]['imagePath'])),),
                SizedBox(height: 5,),
                Text(
                  userName
                ),
                TextField(
                  controller: _passwordCon,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 35,),
                ElevatedButton(
                  onPressed: () {
                    if (_passwordCon.text != usersData[0]['password']){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect Password")));
                    }
                    if (_passwordCon.text == usersData[0]['password']){
                      Navigator.pushReplacement(context, routePush(XPage()));
                    }

                  },
                  child: Text("Offline Sign-in"),
                ),
                Text(usersData.asMap().toString())

              ],
            ),
          ),
        ),
      ),
    );
  }
}
