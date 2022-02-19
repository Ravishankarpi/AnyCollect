import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key key}) : super(key: key);
  @override
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  BottomNavigatorState() : super();
  int selectedIndex = 0;

  onTabClick(int index) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    setState(() {
      selectedIndex = index;
    });
    print("Test $isPortrait");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business, color: Colors.grey),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school, color: Colors.grey),
          label: 'School',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      onTap: onTabClick,
    );
  }
}
