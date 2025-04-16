import 'package:cosmic_pages/screens/bookintro.dart';
import 'package:cosmic_pages/screens/cart.dart';
import 'package:cosmic_pages/screens/likebooks.dart';
import 'package:cosmic_pages/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:cosmic_pages/screens/home.dart';

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
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white,
          selectedItemColor:
              const Color.fromRGBO(49, 73, 111, 1), // Cosmic blue
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
              size: 27, color: const Color.fromRGBO(49, 73, 111, 1)),
          unselectedIconTheme: const IconThemeData(size: 23),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10,
          items: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.book, 1),
            _buildNavItem(Icons.favorite, 2),
            _buildNavItem(Icons.shopping_bag, 3),
            _buildNavItem(Icons.person, 4),
          ],
        ),
      ),
    );
  }

  // BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
  //   bool isSelected = _selectedIndex == index;

  //   return BottomNavigationBarItem(
  //     icon: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       padding: const EdgeInsets.all(8),
  //       decoration: isSelected
  //           ? BoxDecoration(
  //               color: const Color.fromRGBO(231, 234, 250, 1),
  //               borderRadius: BorderRadius.circular(12),
  //             )
  //           : const BoxDecoration(),
  //       child: Icon(icon),
  //     ),
  //     label: '',
  //   );
  // }
  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color.fromRGBO(231, 234, 250, 1),
                borderRadius: BorderRadius.circular(12),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: isSelected
              ? const Color.fromRGBO(49, 73, 111, 1)
              : Colors.grey, // Use unselected color here
        ),
      ),
      label: '',
    );
  }
}
