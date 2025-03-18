import 'package:ders2/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ders 2',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
