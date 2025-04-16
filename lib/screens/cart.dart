import 'package:cosmic_pages/screens/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  // Show payment success snack bar using GetX
  void _showPaymentSuccessSnackBar() {
    Get.snackbar(
      "", // Title (empty as we're using custom content)
      "", // Message (empty as we're using custom content)
      backgroundColor: Colors.white,
      colorText: Colors.black,
      margin: const EdgeInsets.all(10),
      borderRadius: 16,
      duration: const Duration(seconds: 5),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      snackbarStatus: (status) {
        // Optional: do something when the snackbar status changes
      },
      // Custom snackbar content
      messageText: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(49, 73, 111, 1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Payment Successful!!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close the snackbar
              // Navigate to another page if needed
              // Get.to(() => AnotherPage());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color.fromRGBO(49, 73, 111, 1),
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(), // Using GetX navigation
          icon: const Icon(Icons.arrow_back_ios),
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
                "Cart ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/p1.png",
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "author Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          "\$120",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Genre:Slice of life",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          print(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return ['View Book', 'Remove']
                              .map((String choice) => PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  ))
                              .toList();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Summary",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Subtotal",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$50.00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Shipping",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$10.00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$60.00",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _showPaymentSuccessSnackBar,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: const Color.fromRGBO(49, 73, 111, 1),
                  ),
                  child: const Text(
                    'CheckOut',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}