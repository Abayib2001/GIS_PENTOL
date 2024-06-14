// utilitas/logika_pencarian.dart

import 'package:latlong2/latlong.dart';

// Contoh data lokasi pentol dengan nama (dapat diganti dengan data dinamis dari server atau database)
final List<LokasiPentol> lokasiPentol = [
  LokasiPentol(nama: 'Pentol Pegatan', lokasi: LatLng(-3.3194, 114.5909)),
  LokasiPentol(nama: 'Pentol Barabai', lokasi: LatLng(-3.289088, 114.594185)),
  LokasiPentol(nama: 'Pentol Bjm', lokasi: LatLng(-3.3180, 114.5890)),
  // Tambahkan lebih banyak lokasi sesuai kebutuhan
];

// Kelas untuk menyimpan data lokasi pentol
class LokasiPentol {
  final String nama;
  final LatLng lokasi;

  LokasiPentol({required this.nama, required this.lokasi});
}

class LogikaPencarian {
  // Fungsi untuk mencari lokasi pentol terdekat berdasarkan titik tertentu
  static List<LokasiPentol> cariLokasiTerdekat(LatLng titik, double radius) {
    List<LokasiPentol> hasilPencarian = [];

    for (var lokasi in lokasiPentol) {
      if (_hitungJarak(titik, lokasi.lokasi) <= radius) {
        hasilPencarian.add(lokasi);
      }
    }

    return hasilPencarian;
  }

  // Fungsi untuk mencari lokasi pentol berdasarkan nama
  static List<LokasiPentol> cariLokasiBerdasarkanNama(String nama) {
    List<LokasiPentol> hasilPencarian = [];

    for (var lokasi in lokasiPentol) {
      if (lokasi.nama.toLowerCase().contains(nama.toLowerCase())) {
        hasilPencarian.add(lokasi);
      }
    }

    return hasilPencarian;
  }

  // Fungsi untuk menghitung jarak antara dua titik
  static double _hitungJarak(LatLng titik1, LatLng titik2) {
    final Distance distance = Distance();
    return distance.as(LengthUnit.Meter, titik1, titik2);
  }
}
