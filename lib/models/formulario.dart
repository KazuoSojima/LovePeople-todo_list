import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  var novoItem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: novoItem,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 25),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Esse campo é obrigatório!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop(novoItem.text);
                      }
                    },
                    child: Text("Salvar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
