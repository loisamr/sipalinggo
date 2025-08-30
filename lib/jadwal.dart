import 'package:flutter/material.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({Key? key}) : super(key: key);

  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  // Data stasiun (koordinat, nama, warna)
  final List<Map<String, dynamic>> stations = [
    {
      "top": 135.0,
      "left": 12.0,
      "name": "Bandara SMB II",
      "color": Color.fromARGB(255, 107, 92, 91),
    },
    {
      "top": 215.0,
      "left": 39.0,
      "name": "Asrama Haji",
      "color": Color.fromARGB(255, 102, 169, 31),
    },
    {
      "top": 280.0,
      "left": 54.0,
      "name": "Punti Kayu",
      "color": Color.fromARGB(255, 44, 78, 213),
    },
    {
      "top": 310.0,
      "left": 95.0,
      "name": "RSUD",
      "color": Color.fromARGB(255, 231, 231, 234),
    },
    {
      "top": 350.0,
      "left": 70.0,
      "name": "Garuda Dempo",
      "color": Color.fromARGB(255, 79, 80, 84),
    },
    {
      "top": 360.0,
      "left": 80.0,
      "name": "Demang Lebar Daun",
      "color": Color.fromARGB(255, 79, 80, 84),
    },
    {
      "top": 380.0,
      "left": 90.0,
      "name": "Bumi Sriwijaya",
      "color": Color.fromARGB(255, 187, 38, 157),
    },
    {
      "top": 390.0,
      "left": 100.0,
      "name": "Dishub",
      "color": Color.fromARGB(255, 44, 70, 213),
    },
    {
      "top": 400.0,
      "left": 110.0,
      "name": "Cinde",
      "color": Color.fromARGB(255, 246, 232, 37),
    },
    {
      "top": 420.0,
      "left": 120.0,
      "name": "Ampera",
      "color": Color.fromARGB(255, 213, 44, 44),
    },
    {
      "top": 430.0,
      "left": 130.0,
      "name": "Porlesta",
      "color": Color.fromARGB(255, 79, 80, 84),
    },
    {
      "top": 450.0,
      "left": 150.0,
      "name": "Jakabaring",
      "color": Color.fromARGB(255, 246, 232, 37),
    },
    {
      "top": 500.0,
      "left": 160.0,
      "name": "DJKA",
      "color": Color.fromARGB(255, 235, 116, 12),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Jalur
          Positioned.fill(
            child: Image.asset("assets/images/jalur.png", fit: BoxFit.cover),
          ),

          /// Looping titik stasiun
          for (var station in stations)
            Positioned(
              top: station["top"],
              left: station["left"],
              child: Column(
                children: [
                  Text(
                    station["name"],
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Icon(Icons.location_on, color: station["color"], size: 30),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
