import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sipalinggo/model/model.dart';

class JadwalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Mengambil data jadwal dari rute DJKA_BANDARA secara realtime.
  Stream<List<JadwalKereta>> getJadwalRealtime() {
    return _firestore
        .collection('jadwal')
        .doc('DJKA_BANDARA')
        .collection('schedules')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => JadwalKereta.fromFirestore(doc.data()))
              .toList(),
        );
  }
}
