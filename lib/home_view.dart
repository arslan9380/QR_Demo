import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:qr_bar_code_flutter/scan.dart';

import 'generate.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My QR"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Scan Code"),
              leading: Icon(MaterialCommunityIcons.qrcode_scan),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ScanPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Generate QR Code"),
              leading: Icon(MaterialCommunityIcons.qrcode_edit),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GeneratePage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
