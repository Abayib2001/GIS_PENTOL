// layar_cari.dart

import 'package:flutter/material.dart';
import 'package:aplikasi_gis_pentol/utilitas/logika_cari.dart';

class LayarCari extends StatefulWidget {
  final List<Map<String, dynamic>> semuaLokasi;

  LayarCari({required this.semuaLokasi});

  @override
  _LayarCariState createState() => _LayarCariState();
}

class _LayarCariState extends State<LayarCari> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _hasilPencarian = [];

  void _cariLokasi() {
    final query = _searchController.text.toLowerCase();
    final hasilPencarian = widget.semuaLokasi
        .where((lokasi) => lokasi['nama'].toLowerCase().contains(query))
        .toList();

    if (hasilPencarian.isNotEmpty) {
      Navigator.pop(context, hasilPencarian.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Lokasi'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _cariLokasi,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Lokasi',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _cariLokasi,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _hasilPencarian.length,
                itemBuilder: (context, index) {
                  final lokasi = _hasilPencarian[index];
                  return ListTile(
                    leading:
                        Image.asset(lokasi['imagePath'], width: 50, height: 50),
                    title: Text(lokasi['nama']),
                    subtitle: Text(lokasi['alamat']),
                    onTap: () {
                      Navigator.pop(context, lokasi);
                    },
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
