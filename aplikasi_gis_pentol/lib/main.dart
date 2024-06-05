import 'package:flutter/material.dart';
import 'layar/tampilan_awal.dart';

void main() {
  runApp(AplikasiGISPentol());
}

class AplikasiGISPentol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi GIS Pentol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayarAwal(),
    );
  }
}
