import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../layanan/layanan_lokasi.dart';

class TombolLokasi extends StatefulWidget {
  @override
  _TombolLokasiState createState() => _TombolLokasiState();
}

class _TombolLokasiState extends State<TombolLokasi> {
  String pesanLokasi = "Aktifkan Lokasi";

  void _dapatkanLokasiSaatIni() async {
    LayananLokasi layananLokasi = LayananLokasi();
    try {
      Position posisi = await layananLokasi.dapatkanLokasiSaatIni();
      setState(() {
        pesanLokasi =
            "Latitude: ${posisi.latitude}, Longitude: ${posisi.longitude}";
      });
    } catch (e) {
      setState(() {
        pesanLokasi = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _dapatkanLokasiSaatIni,
      child: Text(pesanLokasi),
    );
  }
}
