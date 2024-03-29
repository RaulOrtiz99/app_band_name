import 'package:app_band_name/pages/home.dart';
import 'package:app_band_name/pages/status.dart';
import 'package:app_band_name/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': (_) => HomePage(),
          'status': (context) => StatusPage(),
        },
      ),
    );
  }
}
