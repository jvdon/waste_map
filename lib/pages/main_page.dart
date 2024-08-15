import 'package:flutter/material.dart';
import 'package:waste_map/pages/dropout_page.dart';
import 'package:waste_map/pages/map_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    MapPage(),
    DropoutPage(),
  ];
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedId],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        currentIndex: selectedId,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() {
            selectedId = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_sharp), label: "Mapa"),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "Dropout")
        ],
      ),
    );
  }
}
