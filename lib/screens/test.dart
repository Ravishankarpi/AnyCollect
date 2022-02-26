import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/constants.dart';


Widget forms(BuildContext context){
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  queryData.size.width;
  queryData.size.height;
   return Scaffold( 
     body: Center(
          child: Container(
            decoration: rBoxDecorationStyles,
            width: queryData.size.width - 50,
            // width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment(-0.85, -0.5),
                      child:SizedBox(
                        child: Text("Sort-20", style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                    
                    SizedBox(height: 20,),
                    buildTextField(Icons.person, "Username", queryData),
                    SizedBox(height: 20,),
                    buildTextField(Icons.class_, "Class", queryData),
                    SizedBox(height: 20,),
                    buildTextField(Icons.donut_large_rounded, "Major", queryData),
                    SizedBox(height: 20,),
                    buildTextField(Icons.email, "Email", queryData),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Submit"),
                    ),
                  ]),
            ),
          ),
        ),
   );
}


  SizedBox buildTextField(icon, name, queryData) {
    
    return SizedBox(
      width: queryData.size.width - 100,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
  SizedBox buildDropDown(icon, name, queryData) {
    return SizedBox(
      width: queryData.size.width - 100,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }