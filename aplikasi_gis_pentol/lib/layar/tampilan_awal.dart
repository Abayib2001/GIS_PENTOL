import 'package:aplikasi_gis_pentol/layar/tampilan_peta.dart';
import 'package:flutter/material.dart';
import '../widget/tombol_lokasi.dart';

class LayarAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png'), // Ganti dengan path gambar Anda
            SizedBox(height: 20),
            TombolLokasi(), // Menggunakan widget TombolLokasi
            SizedBox(height: 10),
            Text(
              'Aktifkan Lokasi Anda untuk memulai aplikasi',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LayarPeta()));
                },
                child: Text("MASUK LAYAR PETA"))
          ],
        ),
      ),
    );
  }
}
