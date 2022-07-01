import 'package:flutter/material.dart';

import '../models/band.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'ACDC', votes: 5),
    Band(id: '2', name: 'Metallica', votes: 3),
    Band(id: '3', name: 'The who', votes: 5),
    Band(id: '4', name: 'Ramones', votes: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Band Names",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>
            _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 1, child: Icon(Icons.add), onPressed: addNewBand),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('id: ${band.id}');
        //TODO: llamar el borrado en el server
      },
      background: Container(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Delete Band",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
          // ignore: sort_child_properties_last
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    //esto es para agregar una nueva banda
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text("Add"),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text),
              ),
            ],
          );
        },
      );
    }
  }

// esto agrega una banda a la lista
  void addBandToList(String name) {
    if (name.length > 1) {
      //Podemos agregar
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 10));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
