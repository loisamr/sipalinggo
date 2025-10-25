import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemberitahuan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // default fontFamily: 'Poppins', // uncomment if font added
      ),
      home: const Berita(),
    );
  }
}

class News {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String category; // "Pengumuman" or "Terbaru" or others
  final DateTime date;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.date,
  });
}

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  int selectedIndex = 0;
  final List<String> tabs = [ "Pengumuman", "Terbaru"];

  // Dummy sample data
  final List<News> beritaList = [
    News(
      id: '1',
      title: 'LRT Sumsel Tambah Jam Operasional',
      content:
          'Dinas perhubungan mengumumkan penambahan jam operasional LRT Sumatera Selatan mulai minggu ini. Penambahan ini dilakukan untuk mengakomodasi peningkatan penumpang pada jam sibuk.',
      imageUrl:
          'https://images.unsplash.com/photo-1526662095182-7f5f0e6a4d4d?auto=format&fit=crop&w=1600&q=80',
      category: 'Pengumuman',
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    News(
      id: '2',
      title: 'Event LRT Expo 2025 di Jakabaring',
      content:
          'Expo transportasi dan teknologi menghadirkan berbagai inovasi terkait Lintas Rel Terpadu. Pengunjung dapat melihat prototipe transportasi cerdas dan layanan informasi penumpang baru.',
      imageUrl:
          'https://images.unsplash.com/photo-1508057198894-247b23fe5ade?auto=format&fit=crop&w=1600&q=80',
      category: 'Terbaru',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    News(
      id: '3',
      title: 'Rute Service Kendala Perawatan Malam',
      content:
          'Saat ini beberapa rute mengalami penyesuaian sementara karena perawatan rel malam hari. Penumpang diminta memperhatikan pengumuman di stasiun dan aplikasi resmi LRT.',
      imageUrl:
          'https://images.unsplash.com/photo-1518085250887-7cfe9b3e0b2c?auto=format&fit=crop&w=1600&q=80',
      category: 'Pengumuman',
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    News(
      id: '4',
      title: 'Pembukaan Kantin Baru di Stasiun Bumi Sriwijaya',
      content:
          'Stasiun Bumi Sriwijaya kini memiliki kantin dan pojok baca untuk kenyamanan penumpang. Fasilitas ini menjadi bagian dari program peningkatan pelayanan.',
      imageUrl:
          'https://images.unsplash.com/photo-1526318472351-c75fcf070ee3?auto=format&fit=crop&w=1600&q=80',
      category: 'Berita terbaru',
      date: DateTime.now().subtract(const Duration(hours: 10)),
    ),
  ];

  List<News> get filteredList {
    if (selectedIndex == 0) {
      // Semua
      // Sort by date descending (baru di atas)
      final list = List<News>.from(beritaList);
      list.sort((a, b) => b.date.compareTo(a.date));
      return list;
    } else if (selectedIndex == 1) {
      // Pengumuman
      final list =
          beritaList.where((b) => b.category == 'Pengumuman').toList();
      list.sort((a, b) => b.date.compareTo(a.date));
      return list;
    } else {
      // Berita terbaru
      final list =
          beritaList.where((b) => b.category == 'Terbaru').toList();
      // Berita terbaru juga diurutkan by date desc
      list.sort((a, b) => b.date.compareTo(a.date));
      return list;
    }
  }

  String formatDate(DateTime d) {
    // menggunakan intl DateFormat
    try {
      return DateFormat('dd MMM yyyy • HH:mm').format(d);
    } catch (e) {
      return d.toIso8601String();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FB),
      appBar: AppBar(
        title: const Text(
          'Berita',
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
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
                          // fontFamily: "Poppins",
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

            // List berita
            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        'Tidak ada berita pada kategori ini.',
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          color: Colors.black54,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final news = filteredList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailBerita(news: news),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            margin: const EdgeInsets.only(bottom: 16),
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image with tag
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: SizedBox(
                                        height: 160,
                                        width: double.infinity,
                                        child: Image.network(
                                          news.imageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stack) {
                                            return Container(
                                              color: Colors.grey[200],
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.broken_image,
                                                size: 48,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: news.category == 'Pengumuman'
                                              ? Colors.orange
                                              : Colors.red,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          news.category,
                                          style: const TextStyle(
                                            // fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Title & excerpt
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          // fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        news.content,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          // fontFamily: "Poppins",
                                          fontSize: 13,
                                          color: Colors.black87,
                                          height: 1.4,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatDate(news.date),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.chevron_right,
                                            color: Colors.black26,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

class DetailBerita extends StatelessWidget {
  final News news;
  const DetailBerita({super.key, required this.news});

  String formatDate(DateTime d) {
    try {
      return DateFormat('dd MMMM yyyy • HH:mm').format(d);
    } catch (e) {
      return d.toIso8601String();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FB),
      appBar: AppBar(
        title: const Text('Detail Berita'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: Image.network(
                  news.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) {
                    return Container(
                      height: 230,
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image,
                        size: 64,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                      // fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: news.category == 'Pengumuman'
                              ? Colors.orange.shade700
                              : Colors.blue.shade700,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          news.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        formatDate(news.date),
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.content,
                    style: const TextStyle(
                      // fontFamily: 'Poppins',
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
