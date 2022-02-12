import 'package:flutter/material.dart';
import 'package:one_minute_bloc_tuto/nav/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permissions demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBarPage(),
    );
  }
}
