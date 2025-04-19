import 'package:cosmic_pages/controller/user_auth.dart';
import 'package:cosmic_pages/screens/BottomNavBar.dart';
import 'package:cosmic_pages/screens/authorbookup.dart';
import 'package:cosmic_pages/screens/login.dart';
import 'package:cosmic_pages/screens/orderhistory.dart';
import 'package:cosmic_pages/screens/profilesettings.dart';
import 'package:cosmic_pages/screens/publishedbooks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/snackbar_controller.dart';

class userprofile extends StatefulWidget {
  const userprofile({super.key});

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  final Snackbar _snackbar = Snackbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return ['Edit Profile', 'Setting', 'Logout']
                  .map((String choice) => PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/user1.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Author Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "angelraiyanii@gmail.com",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(149, 175, 202, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.shopping_bag, color: Colors.white),
                      ),
                      title: Text("Shopping History",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        Get.to(orderhistory());
                      },
                    ),
                    Divider(
                        color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.3),
                        thickness: 1,
                        height: 1,
                        indent: 15,
                        endIndent: 15),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text("Profile Settings",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        Get.to(profilesettings());
                      },
                    ),
                    Divider(
                        color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.3),
                        thickness: 1,
                        height: 1,
                        indent: 15,
                        endIndent: 15),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.privacy_tip, color: Colors.white),
                      ),
                      title: Text("Privacy Policies",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                        color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.3),
                        thickness: 1,
                        height: 1,
                        indent: 15,
                        endIndent: 15),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.help, color: Colors.white),
                      ),
                      title:
                          Text("Help", style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                        color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.3),
                        thickness: 1,
                        height: 1,
                        indent: 15,
                        endIndent: 15),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.book, color: Colors.white),
                      ),
                      title: Text("Published Books",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        Get.to(publishedbooks());
                      },
                    ),
                    Divider(
                        color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.3),
                        thickness: 1,
                        height: 1,
                        indent: 15,
                        endIndent: 15),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 45, 107, 1).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child:
                            Icon(Icons.add_circle_outline, color: Colors.white),
                      ),
                      title: Text("Author Book Upload",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        Get.to(authorbookup());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await UserController.logout();
                    if (context.mounted) {
                      _snackbar.showCustomSnackBar(
                        context: context,
                        message: "Logged out successfully",
                        isSuccess: true,
                      );
                    }
                    // Navigate to login screen
                    Get.offAll(() => login());
                  } catch (e) {
                    if (context.mounted) {
                      _snackbar.showCustomSnackBar(
                        context: context,
                        message: "Failed to logout: ${e.toString()}",
                        isSuccess: false,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color.fromRGBO(49, 73, 111, 1),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'LogOut',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const bottomnavbar(),
    );
  }
}
