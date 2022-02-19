
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LocalStoragetest extends StatefulWidget{
  HomePage createState()=> HomePage();
}

class HomePage extends State<LocalStoragetest>{

    var tests;
    SharedPreferences prefTest;

    @override
  void initState() {
    super.initState();
    getValues();
  }
 
  @override
  Widget build(BuildContext context) {
      tests = tests != null ? tests  :"Ravis";
     return Container(
     child: Text(tests, style: TextStyle(color: Colors.white),),
    );
  }

  setTest(SharedPreferences prefTest) async{

    prefTest = await SharedPreferences.getInstance();
    return await prefTest.setString("Name", "Ravi");
}
  getTest(SharedPreferences prefTest) async{
    prefTest = await SharedPreferences.getInstance();
    var  yess = prefTest.getString("Name");
    return yess;
}


getValues()async{
  await setTest(prefTest); 
  await funcThatMakesAsyncCall();
}

Future funcThatMakesAsyncCall() async {
  var result = await getTest(prefTest);
  print(result);  
  setState(() {
    tests = result;
  });
}
 //Your code here
}






