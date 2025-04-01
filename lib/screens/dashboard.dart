import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                    onPressed: () {},
                  ),
                  PopupMenuButton(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    onSelected: (value) {},
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
      body: Column(),
    );
  }
}
