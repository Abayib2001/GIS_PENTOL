import 'dart:math';
import 'dart:ui';
import 'package:aplikasi_gis_pentol/utilitas/logika_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'tampilan_pencarian.dart';
import 'tampilan_ulasan.dart';
import '../utilitas/konstanta.dart';
import 'tampilan_cari.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

const _maxMarkersCount = 20000;

class LayarPeta extends StatefulWidget {
  @override
  _LayarPetaState createState() => _LayarPetaState();
}

class _LayarPetaState extends State<LayarPeta> {
  final LatLng _pusat = Konstanta.pusatDefault;
  final MapController _mapController = MapController();

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  List<Marker> allMarkers = [];

  int numOfMarkers = _maxMarkersCount ~/ 10;

  final List<Map<String, dynamic>> semuaLokasi = [
    {
      'nama': 'Pentol Upin Ipin',
      'alamat': 'Jln. Pelajar dekat Kampus Uniska',
      'jamBuka': 'Buka: Senin-Minggu Jam 4.30 sore - 10 malam',
      'deskripsi': 'Pentol bakar ikan khas',
      'latitude': -3.3194,
      'longitude': 114.5909,
      'imagePath': 'assets/images/lokasi_pentol.png',
    },
    {
      'nama': 'Pentol Goreng Uniska',
      'alamat': 'Jln. Dahlia Halaman Alfamart dekat Hafabi',
      'jamBuka': 'Buka: Senin-Minggu Jam 4.30 sore - 10 malam',
      'deskripsi':
          'Sementara tersedia aneka tahu isi, aneka dimsum, pangsit, dan bakso goreng',
      'latitude': -3.289088,
      'longitude': 114.594185,
      'imagePath': 'assets/images/lokasi_pentol.png',
    },
    {
      'nama': 'Pentol Upin Ipin Coks',
      'alamat': 'Jln. Pelajar depan Mesjid Al-Muhajirin',
      'jamBuka': 'Buka: Senin-Minggu Jam 4.30 sore - 10 malam',
      'deskripsi': 'Pentol dengan variasi coks',
      'latitude': -3.3180,
      'longitude': 114.5890,
      'imagePath': 'assets/images/lokasi_pentol.png',
    },
  ];

  void _navigateToLocation(Map<String, dynamic> lokasi) {
    _mapController.move(LatLng(lokasi['latitude'], lokasi['longitude']), 15);
    showMarkerPopup(
      context,
      lokasi['nama'],
      lokasi['bintang'],
      lokasi['alamat'],
      lokasi['jamBuka'],
      lokasi['deskripsi'],
      lokasi['imagePath'],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layar Peta'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final lokasi = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LayarCari(semuaLokasi: semuaLokasi)),
              );

              if (lokasi != null) {
                _navigateToLocation(lokasi);
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    211, 94, 10, 0.8), // Ganti dengan warna yang diinginkan
              ),
              child: Image.asset('assets/images/logo.png',
                  height: 100), // Ganti dengan path gambar logo.png Anda
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Peta'),
              onTap: () {
                // Handle peta tap
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Handle profil tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                // Handle pengaturan tap
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang'),
              onTap: () {
                // Handle tentang tap
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCameraFit: CameraFit.bounds(
                bounds: LatLngBounds(
                  LatLng(-3.3194, 114.5909),
                  LatLng(-3.289088, 114.594185),
                ),
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 88,
                  bottom: 192,
                ),
              ),
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-3.3541, 114.6163),
                    child: GestureDetector(
                      onTap: () {
                        showMarkerPopup(
                          context,
                          "Nakula Tahu",
                          5,
                          "Jln. raya nakula no.17 Beruntung Jaya Banjarmasin",
                          "Buka : Senin-Sabtu Jam 8 pagi - 6 sore, Minggu Jam-10 pagi-5 Sore",
                          "Semua Menu Ada",
                          'assets/images/lokasi_pentol.png',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/lokasi_pentol.png',
                            width: 30,
                            height: 30,
                          ),
                          Flexible(
                            child: Text(
                              "Nakula Tahu (Outlet Utama)",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              softWrap: false,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Marker(
                    point: LatLng(-3.3254, 114.6084),
                    child: GestureDetector(
                      onTap: () {
                        showMarkerPopup(
                          context,
                          "Cabang Nakula Tahu",
                          4,
                          "Jln. Manggis Sebrang Regulasi Kopi",
                          "Buka : Senin-Sabtu Jam 3 sore - 8 malam",
                          "Sementara tersedia aneka tahu isi, aneka dimsum, pangsit, bakso goreng",
                          'assets/images/lokasi_pentol.png',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/lokasi_pentol.png',
                            width: 30,
                            height: 30,
                          ),
                          Flexible(
                            child: Text(
                              "Nakula Tahu (Cabang)",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              softWrap: false,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Marker(
                    point: LatLng(-3.326394, 114.582160),
                    child: GestureDetector(
                      onTap: () {
                        showMarkerPopup(
                          context,
                          "Cabang Nakula Tahu",
                          4,
                          "Jln. Dahlia Halaman Alfamart dekat Hafabi",
                          "Buka : Senin-Minggu Jam 4.30 sore - 10 malam",
                          "Sementara tersedia aneka tahu isi, aneka dimsum, pangsit, dan bakso goreng",
                          'assets/images/lokasi_pentol.png',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/lokasi_pentol.png',
                            width: 30,
                            height: 30,
                          ),
                          Flexible(
                            child: Text(
                              "Nakula Tahu (Cabang)",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              softWrap: false,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Marker(
                    point: LatLng(-3.3406, 114.6287),
                    child: GestureDetector(
                      onTap: () {
                        showMarkerPopup(
                          context,
                          "Cabang Nakula Tahu",
                          3,
                          "Halaman Alfamart sebrang wong solo pramuka",
                          "Buka : Senin-sabtu Jam 3.30 sore - 9 malam",
                          "tersedia aneka tahu, aneka dimsum, pangsit goreng, dan bakso goreng",
                          'assets/images/lokasi_pentol.png',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/lokasi_pentol.png',
                            width: 30,
                            height: 30,
                          ),
                          Flexible(
                            child: Text(
                              "Nakula Tahu (Cabang)",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                              softWrap: false,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!kIsWeb)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: PerformanceOverlay.allEnabled(),
            ),
          Positioned(
            bottom: 30, // Jarak dari bawah layar
            left: 16, // Jarak dari kiri
            right: 16, // Jarak dari kanan
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(40), // Sudut yang lebih lembut
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    40), // Sudut yang lebih lembut untuk konten dalamnya
                child: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/pentol.png',
                        width: 24,
                        height: 24,
                      ),
                      label: 'Pentol Terdekat',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/pentol_add.png',
                        width: 24,
                        height: 24,
                      ),
                      label: 'Tambah Lokasi',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/pentol_bintang.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      label: 'Review',
                    ),
                  ],
                  onTap: (index) {
                    // Handle item tap
                    switch (index) {
                      case 0:
                        // Handle 'Pentol Terdekat' tap
                        break;
                      case 1:
                        // Handle 'Tambah Lokasi' tap
                        break;
                      case 2:
                        // Handle 'Review' tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewScreen(),
                          ),
                        );
                        break;
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 30, // Jarak dari atas layar
            left: 16, // Jarak dari kiri
            right: 16, // Jarak dari kanan
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius:
                    BorderRadius.circular(40), // Sudut yang lebih lembut
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    40), // Sudut yang lebih lembut untuk konten dalamnya
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LayarPencarian()),
                            );
                          },
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari...',
                              fillColor: Colors.white.withOpacity(0.05),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberOfItemsSlider extends StatelessWidget {
  const NumberOfItemsSlider({
    super.key,
    required this.number,
    required this.onChanged,
    required this.maxNumber,
    this.itemDescription = 'Item',
    int itemsPerDivision = 1000,
  })  : assert(
          (maxNumber / itemsPerDivision) % 1 == 0,
          '`maxNumber` / `itemsPerDivision` must yield integer',
        ),
        divisions = maxNumber ~/ itemsPerDivision;

  final int number;
  final void Function(int) onChanged;
  final String itemDescription;
  final int maxNumber;
  final int divisions;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 4, bottom: 4),
        child: Row(
          children: [
            Tooltip(
              message: 'Adjust Number of ${itemDescription}s',
              child: const Icon(Icons.numbers),
            ),
            Expanded(
              child: Slider.adaptive(
                value: number.toDouble(),
                onChanged: (v) => onChanged(v.toInt()),
                min: 0,
                max: maxNumber.toDouble(),
                divisions: divisions,
                label: number.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.aplikasi_gis_pentol',
      tileProvider: CancellableNetworkTileProvider(),
    );
