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
                image: "assets/images/djka.png",
                nama: "Stasiun DJKA",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Ruang Menyususi,Escalator, Ruang kesehatan,alat difabel,",
                lokasi: "Jl.Sungai Kedukan,Rambutan,Banyuasin regency,kantin",
                status: "Operasional",
                angkutanumum: "feeder,gojek,maxim,bajai",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/jakabaring.png",
                nama: "Stasiun Jakabaring",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator,Ruang Menyususi,Parkir Sepeda, kursi prioritas ",
                lokasi: "Jl.Gubenur H.Bastari no.1039,15 ulu, kec.sebrang ulu 1.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/polres.png",
                nama: "Stasiun Polresta",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, kursi prioritas,ruang kesehatan,ruang menyusui,alat difabel",
                lokasi: "Jl.Gub H bastari No 161, 8 ulu, kec. sebrang ulu 1",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/ampera.png",
                nama: "Stasiun Ampera",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator, kursi prioritas,Ruang kesehatan,Ruang Menyususi,alat difabel,",
                lokasi: "Jl.Sungai Kedukan,Rambutan,Banyuasin regency,kantin",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/cinde.png",
                nama: "Stasiun Cinde",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator,Pkursi prioritas,parkir Sepeda,Ruang Menyususi, kursi prioritas ",
                lokasi: "Jl.17 ilir,kec.ilir timur 1,Kota Palembang.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/dishub.png",
                nama: "Stasiun Dishub",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, kursi prioritas,ruang kesehatan,ruang menyusui,alat difabel",
                lokasi: "Jl.Kapten.A Rivai, Sungai pangeran Kec.Ilir timur 1",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),StationCard(
                image: "assets/images/bumsri.png",
                nama: "Stasiun Bumi sriwijaya",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator,kursi prioritas,Pojok Baca,Tenant,Ruang Menyususi.alat difabel,",
                lokasi: "Jl.Angakatan 45, Lorok Pakjo, kec.Ilir barat 1",
                status: "Operasional",angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/demang.png",
                nama: "Stasiun Demang",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalatorkursi prioritas,Parkir Sepeda,Ruang Menyususi, kursi prioritas ",
                lokasi: "Jl.Siring Agung, Ilir barat 1, Palembang.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/gardem.png",
                nama: "Stasiun Garuda Dempo",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, kursi prioritas,ruang kesehatan,ruang menyusui,alat difabel",
                lokasi: "Jl.Kolonel H.Barlian, ario kemuning, kec.kemuning.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),StationCard(
                image: "assets/images/rsud.png",
                nama: "Stasiun RSUD",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator,kursi prioritas, Ruang kesehatan,Ruang Menyususialat difabel,",
                lokasi: "Jl.Kolonel H. Barlian,Sukabangun, kec.Sukarami.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/punkay.png",
                nama: "Stasiun Punti Kayu",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, Escalator,kursi prioritas,Ruang Menyususi kursi prioritas ",
                lokasi: "Jl.Kolonel H. Barlian, No 69.Karya baru, kec.Sukaramai.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/asramahaji.png",
                nama: "Stasiun Asrama Haji",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, kursi prioritas,ruang kesehatan,ruang menyusui,alat difabel",
                lokasi: "Jl.Letjen Harun Sohar, Kebun Bunga,kec.Sukaramai.",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
              ),
              StationCard(
                image: "assets/images/bandara.png",
                nama: "Stasiun Bandara",
                fasilitas:
                    "Toilet, Mushola, Ruang Tunggu, lift, escalator, kursi prioritas,ruang kesehatan,ruang menyusui,alat difabel",
                lokasi: "Jl.Bandara Sultan Mahmud Badarudin II, Talang Betutu,kec. Sukaramai..",
                status: "Operasional",
                angkutanumum: "sepeda,gojek,maxim,grab",
                destinasi: "Palembang Bird Park,open : 10.00 - 18.00, htm: Rp.50.000 ,800 m dari Stasiun Djka"
                "Opi waterfun ,open : 08.00 - 18.00, htm: Rp.25.000 - Rp.40.000 ,800 m dari Stasiun Djka "
                "Opi mall,open : 10.00 - 22.00, htm: Rp.3.000 - Rp.25.000 /jam, 500 m dari Stasiun Djka",
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
  final String angkutanumum ;
  final String destinasi ;


  const StationCard({
    super.key,
    required this.image,
    required this.nama,
    required this.fasilitas,
    required this.lokasi,
    required this.status,
    required this.angkutanumum,
    required this.destinasi,
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
