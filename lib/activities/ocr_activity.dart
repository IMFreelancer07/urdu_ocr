import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OcrScreen extends StatefulWidget {
  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  File? _selectedImage;
  bool _isImagePicked = false;
  bool _isProcessing = false;
  bool _isProcessed = false;

  // Sample extracted Urdu text from the image
  final List<String> _extractedText = [
    "پانی کے طوفان کے بعد تمام دنیا کے لوگ ایک ہی زبان بولتے تھے۔ اور تمام لوگ ایک تھے۔",
    "زبان کے الفاظ کو استعمال کرتے تھے۔ لوگ مشرقی سمت سے سفر کرتے ہوئے ملک سنعار",
    "کی ایک کھلی جگہ میں آئے۔ وہ وہیں آباد ہو گئے۔ انہوں نے آپس میں ایک دوسرے سے",
    "ہوش آیا! دو سال پہلے کی دھما چوکڑی سے",
    "بنانے کے لیے پنجاب اسمبلی کی قرارداد بنیادی جز ہے",
    "انقلاب میں کرپٹ اور کھوکھلے دشمن کو گرانے کی طاقت"
  ];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isImagePicked = true;
        _isProcessing = true;
        _isProcessed = false;
      });

      // Simulate processing delay
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
        title: Text('OCR'),
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
              _isProcessing ? 'Processing Image' :
              (_isProcessed ? 'Extracted Text' : 'Import or upload image'),
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
                  _isProcessing ? 'assets/processing.png' : 'assets/detected_text.png',
                  fit: BoxFit.cover,
                )
                    : Center(
                  child: Text(
                    'Tap to upload image',
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
                child: ListView.builder(
                  itemCount: _extractedText.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.1),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _extractedText[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}