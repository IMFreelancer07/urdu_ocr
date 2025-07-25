import 'package:flutter/material.dart';
import 'package:urdu_ocr/activities/cnic_ocr_activity.dart';
import 'package:urdu_ocr/activities/home_activity.dart';
import 'package:urdu_ocr/activities/ocr_activity.dart';

import 'activities/text_extraction_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/ocr': (context) => TextExtractorScreen(),
        '/text_extract': (context) => OcrScreen(),
        '/cnic_ocr': (context) => CnicOcrScreen(),
      },
    );
  }
}

