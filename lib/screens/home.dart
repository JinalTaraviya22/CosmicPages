import 'package:cosmic_pages/controller/user_auth.dart';
import 'package:cosmic_pages/screens/BottomNavBar.dart';
import 'package:cosmic_pages/screens/bottomnavbar.dart';
import 'package:cosmic_pages/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/blah.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    iconSize: 30.0,
                    onPressed: () {
                      Get.to(Search());
                    },
                  ),
                  PopupMenuButton(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    onSelected: (String value) {
                      if(value=='Logout'){
                          final user = UserController.logout();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Edit Profile', 'Settings', 'Logout'}
                          .map((String choice) => PopupMenuItem(
                                value: choice,
                                child: Text(choice, style: const TextStyle(color: Colors.white)),
                              ))
                          .toList();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Library",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200, // Adjusted height to fit book image and text
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // First Book (Fixed)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150, // Adjust height for better alignment
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book1.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Van Gogh", // Book Name
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name", // Author Name
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Second Book
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book2.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Monet",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Third Book
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book3.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Picasso",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Purchased Books Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Purchased Books",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 80, // Set a fixed height
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        // First Book
                        Container(
                          width: 200, // Adjust the size of the box
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(149, 175, 202, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/book1.png",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Author Name",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Second Book
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(149, 175, 202, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/book2.png",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Author Name",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Third Book
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(149, 175, 202, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/book3.png",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Author Name",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Text(
                "Bestsellers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(height: 10),
                    // First Book (Fixed)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150, // Adjust height for better alignment
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book1.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Van Gogh", // Book Name
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name", // Author Name
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Second Book
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book2.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Monet",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Third Book
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/book3.png",
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Picasso",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: bottomnavbar(),
    );
  }
}
