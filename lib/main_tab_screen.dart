import 'package:beritaku/page/home.dart';
import 'package:beritaku/page/profile.dart';
import 'package:beritaku/page/webview.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  List<Widget> body = <Widget>[
    const HomeScreen(),
    const WebViewMenu(),
    const ProfileScreen()
  ];

  DateTime? currentBackPressTime;

  void _onTapNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beranda',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: WillPopScope(
          onWillPop: onWillPop, child: body.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueGrey,
          currentIndex: _selectedIndex,
          onTap: _onTapNavBar,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.web), label: 'Portal'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tekan Dua Kali Untuk Keluar Aplikasi');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
