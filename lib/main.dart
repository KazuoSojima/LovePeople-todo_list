import 'package:flutter/material.dart';
import 'models/formulario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                height: 65,
                child: Text(
                  '${index + 1} - ${list[index]}',
                  style: TextStyle(fontSize: 28),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400], width: 2),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          redirectPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void redirectPage() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Formulario(),
      ),
    )
        .then((value) {
      setState(() {
        if (value = null) {
          return;
        }
        list.add(value);
      });
    });
  }
}
