import 'package:geolocator/geolocator.dart';

class LayananLokasi {
  Future<Position> dapatkanLokasiSaatIni() async {
    bool layananAktif;
    LocationPermission izin;

    layananAktif = await Geolocator.isLocationServiceEnabled();
    if (!layananAktif) {
      return Future.error('Layanan lokasi tidak aktif.');
    }

    izin = await Geolocator.checkPermission();
    if (izin == LocationPermission.denied) {
      izin = await Geolocator.requestPermission();
      if (izin == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak.');
      }
    }

    if (izin == LocationPermission.deniedForever) {
      return Future.error(
          'Izin lokasi ditolak permanen, kami tidak bisa meminta izin.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
