import 'package:flutter/material.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:get/get.dart';

class bookstory extends StatefulWidget {
  const bookstory({super.key});

  @override
  State<bookstory> createState() => _bookstoryState();
}

class _bookstoryState extends State<bookstory> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Chapter One",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "The infection comes as fever at night. If you take ill, watch the veins—the tributary of blood travelling down the arms. If they remain as they ever did, you have nothing to fear.\n\n"
                    "If the blood darkens to an inky black, the infection has taken hold.\n\n"
                    "The infection comes as fever at night.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: "I",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                      text:
                          "was nine the first time the Physicians came in house. My uncle and his men were away. My cousin Ione and her brothers played loudly in the kitchen, and my aunt did not hear the pounding at the door until the first man in white robes was already in the parlor. She did not have time to hide me. I was asleep, resting like a cat in the window.\n\n When she shook me awake, her voice was thick with fear. 'Go to the wood,' she whispered, unlatching the window and gently pushing me through the casement to the ground below.\n\nWhen she shook me awake, her voice was thick with fear. 'Go to the wood,' she whispered, unlatching the window and gently pushing me through the casement to the ground below.\n\nwas nine the first time the Physicians came in house. My uncle and his men were away. My cousin Ione and her brothers played loudly in the kitchen, and my aunt did not hear the pounding at the door until the first man in white robes was already in the parlor. She did not have time to hide me. I was asleep, resting like a cat in the window.\n\n",
                      style: TextStyle(fontSize: 17)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
