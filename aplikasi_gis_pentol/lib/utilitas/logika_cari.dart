import 'package:flutter/material.dart';

class LogikaCari {
  static List<Map<String, dynamic>> cariLokasi(
      String query, List<Map<String, dynamic>> semuaLokasi) {
    return semuaLokasi.where((lokasi) {
      final namaLower = lokasi['nama'].toLowerCase();
      final queryLower = query.toLowerCase();

      return namaLower.contains(queryLower);
    }).toList();
  }
}
