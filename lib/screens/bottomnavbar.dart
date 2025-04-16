import 'package:cosmic_pages/screens/bookintro.dart';
import 'package:cosmic_pages/screens/cart.dart';
import 'package:cosmic_pages/screens/likebooks.dart';
import 'package:cosmic_pages/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:get/get.dart';

// Create a persistent controller that will be accessible globally
class NavIndexController extends GetxController {
  static NavIndexController get to => Get.find();
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // List of icons for the navigation bar
  final List<IconData> _icons = [
    Icons.home,
    Icons.book,
    Icons.favorite,
    Icons.shopping_bag,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    // Check if controller is already registered before putting it
    if (!Get.isRegistered<NavIndexController>()) {
      Get.put(NavIndexController(), permanent: true);
    }
  }

  void _onItemTapped(int index) {
    // Get the controller and change the index
    final navController = Get.find<NavIndexController>();
    navController.changeIndex(index);

    // Navigate to the correct screen
    switch (index) {
      case 0: // Home
        Get.off(() => const home(), preventDuplicates: false);
        break;
      case 1: // Library
        Get.off(() => const bookintro(), preventDuplicates: false);
        break;
      case 2: // Favorites
        Get.off(() => const likebooks(), preventDuplicates: false);
        break;
      case 3: // Cart
        Get.off(() => const cart(), preventDuplicates: false);
        break;
      case 4: // Profile
        Get.off(() => const userprofile(), preventDuplicates: false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Obx(() {
          final navController = Get.find<NavIndexController>();
          return BottomNavigationBar(
            currentIndex: navController.selectedIndex.value,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromRGBO(49, 73, 111, 1),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 10,
            items: List.generate(5, (index) => _buildNavItem(index)),
          );
        }),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    final navController = Get.find<NavIndexController>();
    bool isSelected = navController.selectedIndex.value == index;

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
          color:
              isSelected ? const Color.fromRGBO(49, 73, 111, 1) : Colors.grey,
        ),
      ),
      label: '',
    );
  }
}
