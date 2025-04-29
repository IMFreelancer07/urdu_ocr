// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class OcrScreen extends StatefulWidget {
//   @override
//   _OcrScreenState createState() => _OcrScreenState();
// }
//
// class _OcrScreenState extends State<OcrScreen> {
//   File? _selectedImage;
//   bool _isImagePicked = false;
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//         _isImagePicked = true;
//       });
//
//       // Optionally add a delay to simulate upload completion
//       // await Future.delayed(Duration(seconds: 2));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OCR'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         color: Color(0xFF5E4B8B),
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _isImagePicked ? "Text Detection" : "Import or upload image",
//               style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: _pickImage,
//               child: Container(
//                 width: 250,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//                 child: _isImagePicked
//                     ? Image.asset('assets/detected_text.png') // Add your asset here
//                     : Center(
//                   child: Text(
//                     "Tap to upload image",
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (_isImagePicked)
//               Text(
//                 "Image uploaded and processed",
//                 style: TextStyle(color: Colors.greenAccent),
//               ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xFFDDD2F5),
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.black45,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.label), label: 'Label'),
//           BottomNavigationBarItem(icon: Icon(Icons.label), label: 'Label'),
//           BottomNavigationBarItem(icon: Icon(Icons.label), label: 'Label'),
//         ],
//       ),
//     );
//   }
// }
