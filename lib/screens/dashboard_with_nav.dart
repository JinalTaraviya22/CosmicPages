import 'package:cosmic_pages/screens/bookintro.dart';
import 'package:cosmic_pages/screens/cart.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:cosmic_pages/screens/likebooks.dart';
import 'package:cosmic_pages/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_controller.dart';

class DashboardWithNav extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    home(),
    bookintro(),
    likebooks(),
    cart(),
    userprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
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
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeTabIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color.fromRGBO(49, 73, 111, 1),
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 10,
                items: List.generate(5, (index) => _buildNavItem(index)),
              ),
            ),
          ),
        ));
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    final BottomNavController controller = Get.find<BottomNavController>();
    bool isSelected = controller.selectedIndex.value == index;

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
          _icons[index],
          size: isSelected ? 27 : 23,
          color: isSelected ? const Color.fromRGBO(49, 73, 111, 1) : Colors.grey,
        ),
      ),
      label: '',
    );
  }

  // Define your icons here
  final List<IconData> _icons = [
    Icons.home,
    Icons.book,
    Icons.favorite,
    Icons.shopping_bag,
    Icons.person,
  ];
}