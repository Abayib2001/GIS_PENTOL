import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi_gis_pentol/main.dart';

void main() {
  testWidgets(
      'Tampilan awal ditampilkan dengan benar dan navigasi ke tampilan peta',
      (WidgetTester tester) async {
    // Membangun aplikasi dan memicu frame.
    await tester.pumpWidget(AplikasiGISPentol());

    // Verifikasi bahwa tampilan awal ditampilkan.
    expect(find.text('Aktifkan Lokasi'), findsOneWidget);
    expect(find.text('Aktifkan Lokasi Anda untuk memulai aplikasi'),
        findsOneWidget);
    expect(find.text('AKTIFKAN LOKASI'), findsOneWidget);

    // Ketuk tombol 'AKTIFKAN LOKASI' dan memicu frame.
    await tester.tap(find.text('AKTIFKAN LOKASI'));
    await tester.pumpAndSettle();

    // Verifikasi bahwa tampilan peta ditampilkan.
    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
