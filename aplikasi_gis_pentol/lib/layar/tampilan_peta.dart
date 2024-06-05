import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'tampilan_pencarian.dart';
import '../widget/bilah_aplikasi_kostum.dart';
import '../utilitas/konstanta.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

const _maxMarkersCount = 20000;

class LayarPeta extends StatefulWidget {
  @override
  _LayarPetaState createState() => _LayarPetaState();
}

class _LayarPetaState extends State<LayarPeta> {
  final LatLng _pusat = Konstanta.pusatDefault;

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  List<Marker> allMarkers = [];

  int numOfMarkers = _maxMarkersCount ~/ 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MarkerLayer(markers: [
                Marker(
                  point: LatLng(-3.3194, 114.5909),
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Marker(
                  point: LatLng(-3.289088, 114.594185),
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                Marker(
                  point: LatLng(-3.3180, 114.5890),
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ]),
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
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_on),
                      label: 'Pentol Terdekat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_add),
                      label: 'Tambah Lokasi',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.star),
                      label: 'Review',
                    ),
                  ],
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
                          fillColor: Colors
                              .white, // Memberikan warna putih pada TextField
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
