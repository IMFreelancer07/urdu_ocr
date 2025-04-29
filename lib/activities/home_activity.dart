import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Urdu OCR'),
        actions: [
          TextButton(onPressed: () {}, child: Text('Home', style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {}, child: Text('Features', style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {}, child: Text('OCR Demo', style: TextStyle(color: Colors.white))),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          Column(
            children: [
              const Text(
                'Intelligent Urdu OCR Solution',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'AI-driven Urdu handwriting and CNIC recognition — fast, accurate, and seamless.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/sponsor3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ocr');
                    },
                    child: Text('Try OCR'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/features');
                    },
                    child: Text('See Features'),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/sponsor1.png', height: 40),
                const SizedBox(width: 20),
                Image.asset('assets/sponsor2.png', height: 40),
                const SizedBox(width: 20),
                Image.asset('assets/sponsor3.jpg', height: 40,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
