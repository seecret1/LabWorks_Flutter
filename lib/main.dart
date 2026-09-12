import 'package:flutter/material.dart';
import 'package:labwork1/presentation/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.orange),
      ),
      home: const Body(title: 'Мужиков Павел Александрович ПИбд-31'),
    );
  }
}
