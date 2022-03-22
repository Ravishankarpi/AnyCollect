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
  int _page = 0;
  PageController _c;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    _c =  new PageController(
      initialPage: _page,
    );
    super.initState();
  }
  
  List<Widget> buildTiles(MediaQueryData queryData){
    List<Widget> data = [];
           

           tempFormArr.asMap().forEach((key, value) {
            //  if(data.length == 0)
             data.add(SizedBox(height: 3,));
             data.add(
                GestureDetector(
                  onTap: () => {
                    onPressTile(key),
                  },
                  child: SizedBox(
                        height: 80,
                        // width: queryData.size.width / 1.1,
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
                                    tempFormArr[key].label,
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
           });





            //  List.generate(tempFormArr.length, (index) {
            //     return Center(
            //       child:

            //     );
            //   }
              
             
  
  //  data.insert(0, Center(
  //     child: SizedBox(height: 10,)
  //   ));
  
  return data;
  }

   onPressBottonNavication(index){
    setState(() {
      this._page =  index;
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DynamiceForm()));
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
        body: SingleChildScrollView(
          child: SafeArea(
            minimum : EdgeInsets.all(8),
            child: Container(
              color: Colors.transparent,
              // color: const Color.fromARGB(255, 255, 255, 255),
              child: Container(
                padding: EdgeInsets.only(top: 0),
                child: Column(
              
                  children: buildTiles(queryData)
                
                  
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => {
            onPressBottonNavication(value),
          },
        elevation : 10,
        iconSize : 40,
        unselectedItemColor : Color.fromARGB(223, 100, 100, 100),
        currentIndex : _page,
          items : [new BottomNavigationBarItem(label: "Form Details",
            icon: Icon(Icons.add_comment, color: this._page == 0 ? Color.fromARGB(141, 3, 133, 255) : Color.fromARGB(200, 200, 200, 200) , )
          ),new BottomNavigationBarItem(label: "Home",
            icon: Icon(Icons.home, color: this._page == 1 ? Color.fromARGB(141, 3, 133, 255) : Color.fromARGB(200, 200, 200, 200) , )
          ),new BottomNavigationBarItem(label: "Account",
            icon: Icon(Icons.login, color: this._page == 2 ? Color.fromARGB(141, 3, 133, 255) : Color.fromARGB(200, 200, 200, 200) , )
          )]
        ),
        );
  }
}
