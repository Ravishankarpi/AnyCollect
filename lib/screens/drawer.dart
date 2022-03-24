
import 'package:flutter/material.dart';

Widget buildDrawer(bool isDrawer){

    return  Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('anycollect.com'),
            accountEmail: Text('forms@anycollect.com'),
            currentAccountPicture: CircleAvatar(
               backgroundColor: Color.fromARGB(22, 0, 0, 0),
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(Icons.person, size: 70,),)
                  // child: Image(image: AssetImage('assets/images/onboarding0.png'),))
                ),
              ),
             decoration: BoxDecoration(
              color: Color(0xFF2c3c84),
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/onboarding0.png')
              //   // NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
              // ),
            ),
          ),
          // Container(
          //   height: 150,
          //   width: 150,
          //    decoration: BoxDecoration(
          //     color: Color.fromARGB(181, 88, 93, 93),
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage('assets/images/onboarding0.png')
          //       // NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
          //     ),
          //   ),
          // )
        ],
      ),
    );

}