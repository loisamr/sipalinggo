import 'package:flutter/material.dart';
import 'package:sipalinggo/beranda.dart';
import 'package:sipalinggo/pemberitahuan.dart';
import 'package:sipalinggo/informasi.dart';
import 'package:sipalinggo/jadwal.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //definisi halaman
  final List<Widget> page = [Beranda(), Jadwal(), Info(), Berita()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF315A8A),
        unselectedItemColor: Color(0xFFB1B1B1),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        //list icon navigasi
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            label: 'Berita',
          ),
        ],
      ),
    );
  }
}
