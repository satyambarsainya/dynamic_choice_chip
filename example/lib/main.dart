import 'package:dynamic_choice_chip/dynamic_choice_chip.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List dataSource = ["India", "USA", "UK", "Indie"];
  Map countryMap = {};
  String countryName = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      context: context,
                      builder: (context) {
                        // return DynamicMultiChoiceChip(
                        //   activeWidgetColor: Colors.blue,
                        //   unactiveWidgetColor: Colors.pink,
                        //   cancelButtonBgColor: Colors.blue,
                        //   okButtonBgColor: Colors.blue,
                        //   prefixIconColor: Colors.white,
                        //   prefixIcon: Icons.search,
                        //   textFormFieldLabelText: "Search Country",
                        //   textFormFieldBorderColor: Colors.white,
                        //   renderedWidgetBorderColor: Colors.white,
                        //   dataSource: dataSource,
                        //   renderedTextColor: Colors.white,
                        //   renderedTextSize: 12,
                        //   onTap: (values) {
                        //     setState(() {
                        //       countryMap = values;
                        //       values.forEach((key, value) {
                        //         print('Key = $key : Value = $value');
                        //       });
                        //     });
                        //
                        //   },
                        // );
                        return DynamicChoiceChip(
                          activeWidgetColor: Colors.blue,
                          unactiveWidgetColor: Colors.pink,
                          cancelButtonBgColor: Colors.blue,
                          okButtonBgColor: Colors.blue,
                          prefixIconColor: Colors.white,
                          prefixIcon: Icons.search,
                          textFormFieldLabelText: "Search Country",
                          textFormFieldBorderColor: Colors.white,
                          renderedWidgetBorderColor: Colors.white,
                          dataSource: dataSource,
                          renderedTextColor: Colors.white,
                          renderedTextSize: 12,
                          onTap: (index, value) {
                            setState(() {
                              countryName = value;
                              // print("index : ${index} : value : ${value}");
                            });
                          },
                        );
                      });
                  // setState(() {});
                },
                child: const Text("Click"),
              ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const ClampingScrollPhysics(),
              //     itemCount: countryMap.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           color: Colors.blue,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Center(child: Text(countryMap[index])),
              //           ),
              //         ),
              //       );
              //     })
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(countryName)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
