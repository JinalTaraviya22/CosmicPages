import 'package:cosmic_pages/screens/bookintro.dart';
import 'package:cosmic_pages/screens/cart.dart';
import 'package:cosmic_pages/screens/likebooks.dart';
import 'package:cosmic_pages/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:cosmic_pages/screens/home.dart'; // Import your home page

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
        break;
      case 1: // Library

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => bookintro()),
        );
        break;
      case 2: // Favorites

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => likebooks()),
        );
        break;
      case 3: // Cart

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => cart()),
        );
        break;
      case 4: // Profile

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => userprofile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed, // Ensures equal spacing
      selectedItemColor:
          Color.fromRGBO(7, 45, 107, 1), // Change selected icon color
      unselectedItemColor: Colors.grey, // Change unselected icon color
      showSelectedLabels: false, // Hide text labels
      showUnselectedLabels: false, // Hide text labels
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
