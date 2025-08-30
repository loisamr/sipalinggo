import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F3FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ), // padding kanan kiri
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          "Informasi Stasiun",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // List Card Stasiun
              StationCard(
                image: "assets/images/kereta.jpeg",
                nama: "Stasiun Jakabaring",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, Ruang menyusui",
                lokasi: "Opi Mall, Ponpes Al-Fadh, RM.Sederhana",
                status: "Operasional",
              ),
              StationCard(
                image: "assets/images/lrtkereta.jpeg",
                nama: "Stasiun Jakabaring",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, Ruang menyusui",
                lokasi: "Opi Mall, Ponpes Al-Fadh, RM.Sederhana",
                status: "Operasional",
              ),
              StationCard(
                image: "assets/images/kereta.jpeg",
                nama: "Stasiun Jakabaring",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, Ruang menyusui",
                lokasi: "Opi Mall, Ponpes Al-Fadh, RM.Sederhana",
                status: "Operasional",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StationCard extends StatelessWidget {
  final String image;
  final String nama;
  final String fasilitas;
  final String lokasi;
  final String status;

  const StationCard({
    super.key,
    required this.image,
    required this.nama,
    required this.fasilitas,
    required this.lokasi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar + status
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDF5D7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C8A35),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 10,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF298DCC),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  fasilitas,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        lokasi,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
