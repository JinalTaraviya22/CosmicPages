import 'package:cosmic_pages/screens/BottomNavBar.dart';
import 'package:cosmic_pages/screens/author.dart';
import 'package:cosmic_pages/screens/bookstory.dart';
import 'package:cosmic_pages/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bookintro extends StatefulWidget {
  const bookintro({super.key});

  @override
  State<bookintro> createState() => _bookintroState();
}

class _bookintroState extends State<bookintro> {
  bool isFavorite = false;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              color: Color.fromRGBO(49, 73, 111, 1),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                        Center(
                          child:GestureDetector(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/book2.png",
                              width: 150,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: (){
                            Get.to(bookstory());
                          },
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Book Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'By Author Name',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Book Title and Author
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Atomic Habits',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF31496F),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'By James Clear',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF31496F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '₹230',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < 4 ? Icons.star : Icons.star_half,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(2,547 ratings)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Book Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem(Icons.menu_book, '320', 'Pages'),
                  _buildDivider(),
                  _buildStatItem(Icons.language, 'English', 'Language'),
                  _buildDivider(),
                  _buildStatItem(Icons.person, '120k+', 'Readers'),
                ],
              ),
            ),

            // Description Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF31496F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "A supremely practical and useful book. James Clear distils the most fundamental information about habit formation, so you can accomplish more by focusing on less. The book explores the science of small habits, their impact, and how they compound over time to transform your life.\n\nDiscover how making tiny changes to your behavior can lead to remarkable results. Whether you're a team looking to win a championship or an individual hoping to quit smoking, this book provides a proven framework for improving every day.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // Author Info
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/user1.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "James Clear",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF31496F),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.book, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(
                              "3 books",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(author());
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF31496F).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF31496F),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Color(0xFF31496F),
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(cart());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFF31496F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomnavbar(),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF31496F),
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }
}
