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
            Text(
              'Aktifkan Lokasi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24, // Ukuran Tittle
                fontWeight: FontWeight.bold,
                fontFamily: 'sans',
              ),
            ),
            SizedBox(height: 10), // Jarak antara teks dan tombol
            Text(
              'Aktifkan Lokasi Anda',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // Ukuran Normal
                fontFamily: 'Sans',
              ),
            ),
            Text(
              'untuk memulai aplikasi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // Ukuran Normal
                fontFamily: 'Sans',
              ),
            ),
            SizedBox(height: 20), // Jarak antara teks dan tombol

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LayarPeta()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  "Aktifkan Lokasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Ukuran besar
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sans',
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 74, 20, 8), // Ganti dengan warna coklat 700
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Ubah sesuai kebutuhan
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
