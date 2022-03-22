import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/nav_drawer.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/utils/constants.dart';

class ChooseForms extends StatefulWidget {
  const ChooseForms({Key key}) : super(key: key);

  @override
  _ChooseFormsState createState() => _ChooseFormsState();
}

class _ChooseFormsState extends State<ChooseForms> {
  List<AnyCollectForms> tempFormArr = [
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
    AnyCollectForms(label: "AnyCollect", formId: "AnyCollect"),
    AnyCollectForms(label: "AnyCollectForm 3", formId: "AnyCollectForm3"),
  ];
  AnyCollectForms _anyCollectForms;

  // ignore: missing_return
  AnyCollectForms onPressTile(int index) {
    _anyCollectForms = tempFormArr[index];
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DynamiceForm(anyCollectForms: _anyCollectForms)));
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }
  
  List<Center> buildTiles(MediaQueryData queryData){
    List<Center> data = [];
             data =  
             List.generate(tempFormArr.length, (index) {
                return Center(
                  child: GestureDetector(
                    onTap: () => {
                      onPressTile(index),
                    },
                    child: SizedBox(
                      height: 80,
                      width: queryData.size.width / 1.1,
                      child: Align(
                        child: Container(
                          //  alignment: Alignment.bottomCenter,
                          height: 80,
                          width: queryData.size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 30, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  tempFormArr[index].label,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(141, 3, 133, 255)),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(width: 35,),
                                  GestureDetector(
                                    onTap: () => {
                                      debugPrint("Aduit"),
                                      debugPrint("Aduit")
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      // color: Color.fromARGB(255, 0, 119, 255),
                                      alignment: Alignment.center,
                                      //  padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Internal",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      decoration: rTileTagDecorationStyles,
                                    ),
                                  ),
                                  SizedBox(width: 25,),
                                  GestureDetector(
                                    onTap: () => {print("Aduit")},
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      //  padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Aduit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      alignment: Alignment.center,
                                      decoration: rTileTagDecorationStyles,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: rTileBoxDecorationStyles,
                        ),
                      ),
                    ),
                  ),
                );
              }
              
              );
  
  //  data.insert(0, Center(
  //     child: SizedBox(height: 10,)
  //   ));
  
  return data;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(101, 100, 100, 400),
          title: const Text('AnyCollect'),
        ),
        body: SafeArea(
          minimum : EdgeInsets.all(10),
          child: Container(
            color: Colors.transparent,
            // color: const Color.fromARGB(255, 255, 255, 255),
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                     mainAxisExtent: 80,
                    
                    ),
                children: buildTiles(queryData)
              
                
              ),
            ),
          ),
        ));
  }
}
