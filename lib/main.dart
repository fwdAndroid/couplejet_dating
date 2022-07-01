import 'package:couple_jet/couple_jet_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    DevicePreview(
        enabled: false, builder: (context) => CoupleJetApp()), // Wrap your app
  );
}
