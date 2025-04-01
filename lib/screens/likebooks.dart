import 'package:flutter/material.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:get/get.dart';

class likebooks extends StatefulWidget {
  const likebooks({super.key});

  @override
  State<likebooks> createState() => _likebooksState();
}

class _likebooksState extends State<likebooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(home());
          },
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Like Books",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5, // Reduced spacing
                  mainAxisSpacing: 5, // Reduced vertical spacing
                  childAspectRatio: 0.6, // Adjusted for better image scaling
                ),
                children: [
                  // Book 1
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          "assets/images/book1.png",
                          height: 190,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Author Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // Book 2
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          "assets/images/book2.png",
                          height: 190,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Author Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // Book 3
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/book2.png",
                          height: 190,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Author Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Book 4
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/book1.png",
                          height: 190,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Author Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Book 5
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/book1.png",
                          height: 190,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Author Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
