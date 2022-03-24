import 'package:flutter/material.dart';
import 'package:flutter_dev/screens/chooseforms.dart';
import 'package:flutter_dev/screens/formdetails.dart';
import 'package:flutter_dev/screens/login_screen.dart';

class BottomNavigator extends StatefulWidget {
  int Index;
  Function callback;
  // ignore: use_key_in_widget_constructors
  BottomNavigator({this.Index, this.callback}) : super();
  @override
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  BottomNavigatorState() : super();
   int selectedIndex = 1;
  onTabClick(int index) {
    switch (index) {
      case 0:
        {
          widget.callback(index);
          break;
        }
      case 1:
        {
          widget.callback(index);
          break;
        }
      case 2:
        {
          widget.callback(index);
          break;
        }
    }
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    setState(() {
      selectedIndex = index;
    });
    print("Test $isPortrait");
  }

  @override
  Widget build(BuildContext context) {
    print("Test${widget.Index}");
    return BottomNavigationBar(
        onTap: (value) => {onTabClick(value)},
        elevation: 10,
        iconSize: 28,
        // unselectedItemColor: const Color(0xFF4c4c4c),
        selectedItemColor: const Color(0xFF2c3c84),
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(fontFamily: "OpenSans"),
        unselectedLabelStyle: TextStyle(fontFamily: "OpenSans"),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
              label: "My Forms",
              icon: Icon(
                Icons.ballot,
                color: selectedIndex == 0
                    ? Color(0xFF2c3c84)
                    : Color.fromARGB(200, 200, 200, 200),
              )),
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.house_sharp,
                color: selectedIndex == 1
                    ? Color(0xFF2c3c84)
                    : Color.fromARGB(200, 200, 200, 200),
              )),
          BottomNavigationBarItem(
              label: "Account",
              icon: Icon(
                Icons.person,
                color: selectedIndex == 2
                    ? Color(0xFF2c3c84)
                    : Color.fromARGB(200, 200, 200, 200),
              ))
        ]);
  }
}
    
    
  //   BottomNavigationBar(
  //     backgroundColor: Colors.black,
  //     unselectedItemColor: Colors.grey,
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.home,
  //           color: Colors.grey,
  //         ),
  //         label: 'Home',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.business, color: Colors.grey),
  //         label: 'Business',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.school, color: Colors.grey),
  //         label: 'School',
  //       ),
  //     ],
  //     currentIndex: selectedIndex,
  //     selectedItemColor: Colors.white,
  //     onTap: onTabClick,
  //   );
  // }
