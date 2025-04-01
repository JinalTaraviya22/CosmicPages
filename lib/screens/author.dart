import 'package:flutter/material.dart';


class author extends StatefulWidget {
  const author({super.key});

  @override
  State<author> createState() => _authorState();
}

class _authorState extends State<author> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/book1.png",
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: PopupMenuButton<String>(
                    color: Colors.white,
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
                    icon: Icon(Icons.more_vert, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    "Author Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  "About author",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "A supremely practical and useful book. James Clear distils the most fundamental information about habit formation, so you can accomplish more by focusing on less.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Books",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      "assets/images/book1.png",
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      "assets/images/book2.png",
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      "assets/images/book1.png",
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
