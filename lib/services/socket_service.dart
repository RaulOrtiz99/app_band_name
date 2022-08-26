import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum SeverStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  SeverStatus _severStatus = SeverStatus.Connecting;

  get serverStatus => this._severStatus;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    IO.Socket socket = IO.io('http://localhost:3000/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on('connect', (_) {
      this._severStatus = SeverStatus.Online;
      notifyListeners();
    });


    socket.on('disconnect', (_) {
      this._severStatus = SeverStatus.Offline;
      notifyListeners();
    });


    socket.on('nuevo-mensaje',(payload){
      print('nuevo-mensaje: ${payload}');
    });



  }
}
