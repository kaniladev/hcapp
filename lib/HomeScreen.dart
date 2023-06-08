import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'content/fromFlag.dart';
import 'content/pageContent.dart';
import 'content/pageHeader.dart';
import 'content/pageImage.dart';
import 'content/pageTitle.dart';
import 'content/r01Buttons.dart';
import 'var.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // List<Map<String, dynamic>> jsonData = [];
  // List<Map<String, dynamic>> flagList = [];

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

  String selectedId = "R01-001";
  // String selectedId = "CH02_02-001";
  String nationality = "Afghanistan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage("assets/hclogo.png"), height: 50,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a circular progress indicator while loading data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if loading data fails
            return const Center(child: Text('Error loading data'));
          } else {
            // Once data is loaded, compute the selected data and build the UI
            final selectedData = jsonData.isNotEmpty ? jsonData.firstWhere((element) => element['id'] == selectedId) : null;
            if (selectedData == null) {
              return const Center(child: Text('Selected data not found'));
            } else if (selectedData['template'] == 'R01') {
              return templateR01(selectedData, context);
            } else if (selectedData['template'] == 'R02') {
              return templateR02(selectedData, context);
            } else if (selectedData['template'] == 'R03') {
              return templateR03(selectedData, context);
            } else if (selectedData['template'] == 'R04') {
              return templateR04(selectedData, context);
            } else if (selectedData['template'] == 'R05') {
              return templateR05(selectedData, context);
            } else if (selectedData['template'] == 'R06') {
              return templateR06(selectedData, context);
            } else if (selectedData['template'] == 'R07') {
              return templateR07(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_01') {
              return templateCH0X_01(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_02') {
              return templateCH0X_02Test(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_03') {
              return templateCH0X_03(selectedData, context);
            } else if (selectedData['template'] == 'CH0X_04') {
              return templateCH0X_04(selectedData, context);
            } else {
              return Center(child: Text("Else"),);
            }
          }
        },
      ),
    );
  }
  SingleChildScrollView templateCH0X_04(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateCH0X_03(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateCH0X_02(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pageTitle(selectedData, context),
            pageHeader(selectedData, context),
            pageImage(selectedData),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  Stack templateCH0X_02Test(Map<String, dynamic> selectedData, BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageTitle(selectedData, context),
                // pageHeader(selectedData, context),
                pageImage(selectedData),
                pageContent(selectedData, context),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
        ),
        pageNavigator(selectedData)
      ],
    );
  }


  SingleChildScrollView templateCH0X_01(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR07(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            pageContent(selectedData, context),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR06(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            avatarImages(selectedData),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR05(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            FromFlags(),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR04(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            const SizedBox(
              height: defaultPadding,
            ),
            pageButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR03(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageHeader(selectedData, context),
            pageImage(selectedData),
            const SizedBox(
              height: defaultPadding,
            ),
            pageAgeButtons(selectedData),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView templateR02(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageTitle(selectedData, context),
                        pageImage(selectedData),
                        pageContent(selectedData, context),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        pageButtons(selectedData),
                      ],
                    ),
                  ),
                );
  }

  SingleChildScrollView templateR01(Map<String, dynamic> selectedData, BuildContext context) {
    return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageTitle(selectedData, context),
                        pageContent(selectedData, context),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        R01Buttons(selectedData: selectedData,),
                      ],
                    ),
                  ),
                );
  }
  //
  // Builder pageHeader(Map<String, dynamic> selectedData, BuildContext context) {
  //   return Builder(
  //     builder: (context) {
  //       if(selectedData['header'].toString().length >= 61){
  //         return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //       } else if (selectedData['header'].toString().length >= 21 && selectedData['header'].toString().length <= 60) {
  //         return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //       } else {
  //         return Text(selectedData['header'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //       }
  //     }
  //   );
  // }

  // Image pageImage(Map<String, dynamic> selectedData) => Image(image: AssetImage(selectedData['image']));

  Column pageNavigator(selectedData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              final button = selectedData['buttons'][0];

              setState(() {
                selectedId  = button['linkto'];
              });

            }, icon: Icon(Icons.arrow_back_ios_sharp)),
            IconButton(onPressed: (){
              final button = selectedData['buttons'][1];

              setState(() {
                selectedId  = button['linkto'];
              });
            }, icon: Icon(Icons.arrow_forward_ios_sharp)),
          ],
        ),
      ],
    );
  }

  ListView pageButtons(Map<String, dynamic> selectedData) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: selectedData['buttons'].length,
                          itemBuilder: (context, index) {
                            final button = selectedData['buttons'][index];
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedId  = button['linkto'];
                                });
                              },
                              child: Text(button['text']),
                            );
                          }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                        );
  }

  // Widget R01Buttons(Map<String, dynamic> selectedData) {
  //   return Column(
  //     children: [
  //       ElevatedButton(
  //       onPressed: () {
  //         final button = selectedData['buttons'][0];
  //
  //         Navigator.push(context, routeRL(templateR01(selectedData, context)));
  //
  //     setState(() {
  //       selectedId  = button['linkto'];
  //     });
  //   },
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(selectedData['buttons'][0]['text']),
  //       SizedBox(width: 5,),
  //       Icon(Icons.arrow_circle_right_rounded)
  //     ],
  //   ),
  //   ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           IconButton(
  //             onPressed: () {
  //               final button = selectedData['buttons'][1];
  //               setState(() {
  //                 selectedId  = button['linkto'];
  //               });},
  //             icon: Icon(Icons.arrow_circle_left)),
  //           InkWell(
  //               onTap: (){
  //                 final button = selectedData['buttons'][1];
  //                 setState(() {
  //                   selectedId  = button['linkto'];
  //                 });
  //               },
  //               child: Text(selectedData['buttons'][1]['text'], style: TextStyle(decoration: TextDecoration.underline),)),
  //         ],
  //       )
  //     ],
  //   );
  // }

  GridView avatarImages(Map<String, dynamic> selectedData) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: selectedData['image'].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      childAspectRatio: 1
      ),
      itemBuilder: (BuildContext context, int index) {
    final photo = selectedData['image'][index];
        return Image(image: AssetImage(photo["image"]));},);
  }

  GridView pageAgeButtons(Map<String, dynamic> selectedData) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: selectedData['buttons'].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      childAspectRatio: 3),
      itemBuilder: (BuildContext context, int index) {
    final button = selectedData['buttons'][index];
        return ElevatedButton(
        onPressed: () {
        setState(() {
        selectedId  = button['linkto'];
        });
        },
        child: Text(button['text']),
        );},);
    // View.separated(
    //                       shrinkWrap: true,
    //                       itemCount: selectedData['buttons'].length,
    //                       itemBuilder: (context, index) {
    //                         final button = selectedData['buttons'][index];
    //                         return ElevatedButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               selectedId  = button['linkto'];
    //                             });
    //                           },
    //                           child: Text(button['text']),
    //                         );
    //                       }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
    //                     );
  }

  // Text pageContent(Map<String, dynamic> selectedData, BuildContext context) {
  //   return Text(
  //                         selectedData['content'],
  //                         textAlign: TextAlign.center,
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .bodyLarge!
  //                             .copyWith(color: Colors.black,),
  //                       );
  // }

  // Builder pageTitle(Map<String, dynamic> selectedData, BuildContext context) {
  //   return Builder(
  //       builder: (context) {
  //         if(selectedData['title'].toString().length >= 61){
  //           return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //         } else if (selectedData['title'].toString().length >= 21 && selectedData['title'].toString().length <= 60) {
  //           return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //         } else {
  //           return Text(selectedData['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
  //         }
  //       }
  //   );
  // }
}
