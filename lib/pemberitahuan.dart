import 'package:flutter/material.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  int selectedIndex = 0;
  final List<String> tabs = ["Semua", "Pengumuman", "Berita terbaru"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF6FB),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Text(
                        "Berita",
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

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  bool isActive = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isActive ? Colors.blue : Colors.black54,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Daftar Berita
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                "assets/images/lrtkereta.jpeg", // ganti dengan gambar kamu
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "Utama",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "Lintas Rel Terpadu (LRT) Sumatera Selatan adalah sebuah sistem ",
                                ),
                                TextSpan(
                                  text: "angkutan cepat",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                TextSpan(
                                  text:
                                      " dengan model Lintas Rel Terpadu yang beroperasi di ",
                                ),
                                TextSpan(
                                  text: "Palembang, Indonesia.",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                TextSpan(
                                  text: " Transportasi ini menghubungkan ",
                                ),
                                TextSpan(
                                  text:
                                      "Bandar Udara Internasional Sultan Mahmud Badaruddin II",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                TextSpan(text: " dengan "),
                                TextSpan(
                                  text: "Kompleks Olahraga Jakabaring.",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
