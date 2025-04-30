import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CnicOcrScreen extends StatefulWidget {
  @override
  _CnicOcrScreenState createState() => _CnicOcrScreenState();
}

class _CnicOcrScreenState extends State<CnicOcrScreen> {
  File? _selectedImage;
  bool _isImagePicked = false;
  bool _isProcessing = false;
  bool _isProcessed = false;

  // Demo extracted CNIC data
  final Map<String, String> _extractedData = {
    'Name (نام)': 'Feng Lin Cui (فینگ لِن کُوئی)',
    'Father Name (ولدیت کا نام)': 'Hsi Ping Tsui (ہشی پنگ تسوئی)',
    'Gender (جنس)': 'M (مذکر)',
    'Country of Stay (مقامِ قیام)': 'China, Mainland (چین (مین لینڈ))',
    'Identity Number (شناختی نمبر)': '90008-0100170-5 (۹۰۰۰۸-۰۱۰۰۱۷۰-۵)',
    'Date of Birth (تاریخِ پیدائش)': '09.10.1972 (۰۹٫۱۰٫۱۹۷۲)',
    'Date of Issue (تاریخِ اجرا)': '24.04.2017 (۲۴٫۰۴٫۲۰۱۷)',
    'Date of Expiry (تاریخِ اختتام)': '24.04.2027 (۲۴٫۰۴٫۲۰۲۷)',
  };

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isImagePicked = true;
        _isProcessing = true;
        _isProcessed = false;
      });
      // Simulate processing time
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _isProcessing = false;
        _isProcessed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNIC OCR'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Color(0xFF5E4B8B),
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _isProcessing || _isProcessed
                  ? 'Processing CNIC' // same during and after
                  : 'Upload CNIC Image',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: !_isProcessing ? _pickImage : null,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: _isImagePicked
                    ? Image.asset(
                        'assets/cnic_placeholder.png',
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                          'Tap to select CNIC',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 16),
            if (_isProcessing)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            if (_isProcessed) ...[
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _extractedData.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              '${entry.key}:',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              entry.value,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
