//flutter pub add file_picker  - command for install package

import 'package:cosmic_pages/screens/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class profilesettings extends StatefulWidget {
  const profilesettings({super.key});

  @override
  State<profilesettings> createState() => _profilesettingsState();
}

class _profilesettingsState extends State<profilesettings> {
  String? fileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name; // Get the file name
      });
    }
  }

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Profile Settings",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: fileName ?? "No File Selected"),
                decoration: InputDecoration(
                  labelText: 'File Upload',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: pickFile,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author Description',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Change Password",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
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
                      'Save',
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
