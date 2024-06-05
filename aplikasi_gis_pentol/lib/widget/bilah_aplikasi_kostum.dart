import 'package:flutter/material.dart';

class BilahAplikasiKustom extends StatelessWidget
    implements PreferredSizeWidget {
  final String judul;
  final List<Widget>? tindakan;

  BilahAplikasiKustom({required this.judul, this.tindakan});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(judul),
      actions: tindakan,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
