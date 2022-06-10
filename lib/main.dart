import 'package:flutter/material.dart';

import 'main_tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beritaku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // ignore: prefer_const_constructors
        '/': (context) => MainTabScreen(),
      },
      initialRoute: '/',
    );
  }
}
