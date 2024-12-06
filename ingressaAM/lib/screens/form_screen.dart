import 'package:entregar/data/vestibular_provider.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.formContext});

  final BuildContext formContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController tituloCurtoController = TextEditingController();
  TextEditingController tituloLongoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidate(String? value) {
    if(value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Vestibular'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if(valueValidate(value)) {
                          return 'Insira a abreviação do vestibular';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: tituloCurtoController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Título Curto',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if(valueValidate(value)) {
                          return 'Insira o nome completo do vestibular';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: tituloLongoController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Título Longo',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      VestibularProvider.of(widget.formContext).newPersonagem(
                          tituloCurtoController.text,
                          tituloLongoController.text
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vestibular criado com sucesso!')));
                      Navigator.pop(context);
                    }
                  },
                    child: const Text('Adicionar'),
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
