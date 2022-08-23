import 'package:app_band_name/pages/home.dart';
import 'package:app_band_name/pages/status.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'status',
      routes: {
        'home': (_) => HomePage(),
        'status': (context) => StatusPage(),
      },
    );
  }
}
