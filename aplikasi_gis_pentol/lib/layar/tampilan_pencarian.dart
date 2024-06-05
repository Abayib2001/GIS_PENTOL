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
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Building Name'),
            subtitle: Text('Location Name, Area Name'),
            trailing: Text('100 m'),
          );
        },
      ),
    );
  }
}
