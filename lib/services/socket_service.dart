import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum SeverStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  SeverStatus _severStatus = SeverStatus.Connecting;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    IO.Socket socket = IO.io('http://localhost:3000/', {
      'transport': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) {
      print('connect');
    });

    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }
}
