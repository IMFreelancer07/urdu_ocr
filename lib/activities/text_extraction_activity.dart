import 'package:flutter/material.dart';

class TextExtractorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A2F), // dark gradient base
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  // Left Side Text
                  const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Extract text from images',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),

                          Text(
                            'Text Extractor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/text_extract');
                        },
                        child: Text('Text OCR'),
                      ),
                      const SizedBox(width: 5),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cnic_ocr');
                        },
                        child: const Text('CNIC OCR'),
                      ),
                    ],
                  ),

                  // Right Side Image
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Image.asset(
                        'assets/ai_brain_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Arrows

          ],
        ),
      ),
    );
  }
}
