import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  get stream => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F3FA), // warna latar biru muda

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Sapaan
            Row(
              children: [
                Text(
                  "Selamat Malam,LRT zen",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 19, 240),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "#WongKitoGalo",
              style: TextStyle(color: Colors.blue, fontFamily: "Poppins"),
            ),
            Text(
              "#PayoNaekLRT",
              style: TextStyle(color: Colors.blue, fontFamily: "Poppims"),
            ),
            const SizedBox(height: 15),
            // Foto LRT
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/lrt1.png"),
            ),

            const SizedBox(height: 16),

            // 2 Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menuButton(
                  icon: Icons.access_time,
                  title: "Jadwal kereta Real-Time",
                  subtitle: "Cek Jadwal Terkini",
                ),
                _menuButton(
                  icon: Icons.location_on,
                  title: "Detail Stasiun",
                  subtitle: "Alamat & Fasilitas Stasiun",
                ),
                _menuButton(
                  icon: Icons.location_on,
                  title: "Detail Stasiun",
                  subtitle: "Destinasi & Angkutan Stasiun",
                ),
                _menuButton(
                  icon: Icons.location_on,
                  title: "Pemberitahuan",
                  subtitle: "Berita & Pengumuman Stasiun",
                ),
              ],
            ),

            const SizedBox(height: 20),
        stream _service.getJadwalRealtime(),
        builder: (context, snapshot) 
          if (snapshot.hasError) {
            return const Center(child: Text("Terjadi kesalahan memuat data"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final jadwals = snapshot.data ?? [];

          if (jadwals.isEmpty) {
            return const Center(child: Text("Belum ada jadwal tersedia"));
          }

          return ListView.builder(
            itemCount: jadwals.length,
            itemBuilder: (context, index) {
              final jadwal = jadwals[index];
              final status = TimeHelper.getStatus(jadwal.start, jadwal.end);

              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 4,
                child: ExpansionTile(
                  title: Text(
                    jadwal.direction,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${jadwal.start} - ${jadwal.end}"),
                      const SizedBox(height: 4),
                      Text(
                        "Status: $status",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: status == "Belum berangkat"
                              ? Colors.blue
                              : status == "Sedang dalam perjalanan"
                              ? Colors.orange
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                  children: jadwal.stasiun.map((stasiun) {
                    return ListTile(
                      leading: const Icon(Icons.train),
                      title: Text(stasiun.nama),
                      trailing: Text(stasiun.waktu),
                    );
                  }).toList(),
                ),
              );
            },
          );
    ),
    
}


  // Widget Menu Button
  Widget _menuButton({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[800],
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  // Widget Schedule Card
  Widget _scheduleCard({
    required String tujuan,
    required String platform,
    required String waktu,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tujuan,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                platform,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                waktu,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey[800],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
