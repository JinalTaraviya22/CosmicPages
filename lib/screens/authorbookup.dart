////flutter pub add file_picker  - command for install package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cosmic_pages/screens/home.dart';

class authorbookup extends StatefulWidget {
  const authorbookup({super.key});

  @override
  State<authorbookup> createState() => _authorbookupState();
}

class _authorbookupState extends State<authorbookup> {
  String? fileName;
  String? coverName;

  Future<void> pickFile({required bool isCover}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        if (isCover) {
          coverName = result.files.single.name;
        } else {
          fileName = result.files.single.name;
        }
      });
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Book InFo",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Genres',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Book Discription',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                readOnly: true,
                controller: TextEditingController(
                    text: coverName ?? "No File Selected"),
                decoration: InputDecoration(
                  labelText: 'Cover Upload',
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () => pickFile(isCover: true),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () => pickFile(isCover: false),
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
    );
  }
}
