import 'package:flutter/material.dart';
import 'package:aracatiturismo/HomePage.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
      runApp(new MaterialApp( home: new Home(), ));
    });
}
