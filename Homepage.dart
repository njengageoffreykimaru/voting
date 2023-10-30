import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0; // The index of the selected tab.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E_voting System"),
      ),
      body: Center(


      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote_outlined),
            activeIcon: Icon(Icons.how_to_vote_sharp),
            label: "Vote",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            activeIcon: Icon(Icons.person_2),
            label: "Add Candidates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.where_to_vote_rounded),
            activeIcon: Icon(Icons.how_to_vote_outlined),
            label: "View Winners",
          ),
        ],
        currentIndex: selectedTab,
        selectedItemColor: Colors.blue, // Change the selected tab color
        unselectedItemColor: Colors.grey, // Change the unselected tab color
        showUnselectedLabels: true, // Show or hide labels on unselected tabs
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Style for the selected label
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), // Style for unselected labels
        type: BottomNavigationBarType.fixed, // Allows more than three tabs
        backgroundColor: Colors.white, // Background color of the bottom navigation bar
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
      ),

    );
  }
}
