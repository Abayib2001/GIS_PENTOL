import 'package:flutter/material.dart';
import '../widget/bilah_aplikasi_kostum.dart';

class LayarPencarian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BilahAplikasiKustom(
        judul: 'Pencarian',
      ),
      body: ListView.builder(
        itemCount: 4, // Ubah jumlah item sesuai dengan jumlah lokasi
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.location_on),
            title: Text(_getBuildingName(index)),
            subtitle: Text('Location Name, Area Name'),
            trailing: Text('100 m'),
          );
        },
      ),
    );
  }

  String _getBuildingName(int index) {
    switch (index) {
      case 0:
        return 'Nakula Tahu (Outlet Utama Banjarmasin)';
      case 1:
        return 'Nakula Tahu (Outlet Cabang Pramuka)';
      case 2:
        return 'Nakula Tahu (Outlet Cabang Manggis)';
      case 3:
        return 'Nakula Tahu (Outlet Cabang Dahlia)';
      default:
        return 'Unknown Building';
    }
  }
}
