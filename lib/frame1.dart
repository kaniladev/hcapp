
import 'package:flutter/material.dart';

import 'frame2.dart';
import 'pageRoute.dart';
import 'sql_functions.dart';
import 'var.dart';

class Frame1 extends StatefulWidget {
  const Frame1({Key? key}) : super(key: key);

  @override
  State<Frame1> createState() => _Frame1State();
}

class _Frame1State extends State<Frame1> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loadAccountsData() async {
    final data = await SQLFunction.getItems();
    setState(() {
      accountsData = data;
    });
  }

  Future<void> _addItem() async {
    await SQLFunction.createItem(_usernameController.text, _passwordController.text);
    loadAccountsData();
    print("...number of items ${accountsData.length}");
  }

  Future<void> _updateItem(int id) async {
    await SQLFunction.updateItem(id, _usernameController.text, _passwordController.text);
    print("...number of items ${accountsData.length}");
  }

  void _showForm (int? id) async {
    if (id != null) {
      final existingJournal =
      accountsData.firstWhere((element) => element['id'] == id);
      _usernameController.text = existingJournal['title'];
      _passwordController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(hintText: 'username'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    if(id == null){
                      await _addItem();
                    }
                    // if(id != null){
                    //   await _updateItem(id);
                    // }

                    _usernameController.text = '';
                    _passwordController.text = '';

                    Navigator.of(context).pop();

                    Navigator.push(context, routePush(Frame2()));

                  }, child: Text('Create New'))
            ],
          ),
        ));

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.75,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const Image(
                image: AssetImage("assets/hclogo.png")),
          ),
          SizedBox(height: 50,),
          Text("Hemayat Christa", textAlign: TextAlign.center, style: TextStyle(fontSize: 30),),
          SizedBox(height: 50,),
          Row(children: [
            SizedBox(width: 15,),
            Expanded(child: ElevatedButton(onPressed: () async {

              _showForm(null);

            }, child: FittedBox(child: Text('Create an Account')))),
            SizedBox(width: 10,),
            Expanded(child: ElevatedButton(onPressed: (){
              
              Navigator.push(context, routePush(Frame2()));
              
            }, child: FittedBox(child: Text('Offline Sign-in')))),
            SizedBox(width: 15,),
          ],)
        ],
      ),
    );
  }
}
