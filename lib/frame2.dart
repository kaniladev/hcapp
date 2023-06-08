
import 'package:flutter/material.dart';

import 'frame3.dart';
import 'pageRoute.dart';
import 'sql_functions.dart';
import 'var.dart';

class Frame2 extends StatefulWidget {
  const Frame2({Key? key}) : super(key: key);

  @override
  State<Frame2> createState() => _Frame2State();
}

class _Frame2State extends State<Frame2> {

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 120,),
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 25,),
            Expanded(
                child: accountsData.length == 0 ? Center(child: Text('No Account Registered')) : GridView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: accountsData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 25,

                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        final data = await SQLFunction.getItem(accountsData[index]['id']);
                        setState(() {
                          usersData = data;
                          userName = accountsData[index]['username'];
                          passWord = accountsData[index]['password'];
                        });
                        Navigator.push(context, routePush(Frame3()));
                      },

                      child: Column(
                        children: [
                          CircleAvatar(radius: 48, child: Image(image: AssetImage(accountsData[index]['imagePath'])),),
                          SizedBox(height: 5,),
                          Text(accountsData[index]['username'], maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                        ],
                      ),
                    ))),
            SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_circle_left),
                  SizedBox(width: 5,),
                  Text("Back to Home Screen"),
                ],
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
