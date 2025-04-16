import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class authorbookup extends StatefulWidget {
  const authorbookup({super.key});

  @override
  State<authorbookup> createState() => _authorbookupState();
}

class _authorbookupState extends State<authorbookup> {
  String? fileName;
  String? coverName;
  final _formKey = GlobalKey<FormState>();

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

  void showCustomSnackBar({
    required BuildContext context,
    required String message,
    required bool isSuccess,
    VoidCallback? onButtonPressed,
    String buttonText = 'OK',
    Duration duration = const Duration(seconds: 5),
  }) {
    final Color primaryColor = isSuccess
        ? const Color.fromRGBO(49, 73, 111, 1) // Blue for success
        : Colors.red; // Red for error

    final IconData iconData = isSuccess ? Icons.check : Icons.error_outline;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        duration: duration,
        dismissDirection: DismissDirection.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        content: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onButtonPressed ??
                  () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Book Info",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.book, color: Color.fromRGBO(49, 73, 111, 1)),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Share your book with readers",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 25),

                // Name field
                _buildTextField(
                  labelText: 'Name',
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Price field
                _buildTextField(
                  labelText: 'Price',
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Genres field
                _buildTextField(
                  labelText: 'Genres',
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter at least one genre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Description field
                _buildTextField(
                  labelText: 'Book Description',
                  isRequired: true,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Cover upload field
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: coverName ?? "No File Selected"),
                  decoration: InputDecoration(
                    labelText: 'Cover Upload',
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Color(0xFFDEDEDE),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   "*",
                        //   style: TextStyle(color: Colors.red, fontSize: 20),
                        // ),
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: () => pickFile(isCover: true),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // File upload field
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: fileName ?? "No File Selected"),
                  decoration: InputDecoration(
                    labelText: 'File Upload',
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Color(0xFFDEDEDE),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   "*",
                        //   style: TextStyle(color: Colors.red, fontSize: 20),
                        // ),
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: () => pickFile(isCover: false),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Submit button with enhanced styling
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(49, 73, 111, 0.3),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validate required file fields
                        if (coverName == null || fileName == null) {
                          showCustomSnackBar(
                            context: context,
                            message: 'Please upload both cover and book file',
                            isSuccess: false,
                          );
                        } else {
                          // Process the form
                          showCustomSnackBar(
                            context: context,
                            message: 'Processing your upload...',
                            isSuccess: true,
                            buttonText: 'Done',
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color.fromRGBO(49, 73, 111, 1),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Required fields note
                // Row(
                //   children: [
                //     Text(
                //       "* ",
                //       style: TextStyle(color: Colors.red, fontSize: 16),
                //     ),
                //     Text(
                //       "Required fields",
                //       style: TextStyle(color: Colors.grey[600], fontSize: 14),
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    bool isRequired = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black54,
        ),
        filled: true,
        fillColor: Color(0xFFDEDEDE),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // suffixIcon: isRequired
        //     ? Container(
        //         padding: EdgeInsets.only(top: 16, right: 12),
        //         child: Text(
        //           "*",
        //           style: TextStyle(color: Colors.red, fontSize: 20),
        //         ),
        //       )
        //     : null,
      ),
    );
  }
}
