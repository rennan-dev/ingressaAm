import 'package:flutter/material.dart';
import 'package:entregar/data/vestibular_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _tituloCurtoController = TextEditingController();
  final _tituloLongoController = TextEditingController();
  final _perguntaController = TextEditingController();
  final _respostaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Vestibular'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tituloCurtoController,
              decoration: const InputDecoration(
                labelText: 'Título Curto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tituloLongoController,
              decoration: const InputDecoration(
                labelText: 'Título Longo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _perguntaController,
              decoration: const InputDecoration(
                labelText: 'Pergunta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _respostaController,
              decoration: const InputDecoration(
                labelText: 'Resposta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  final tituloCurto = _tituloCurtoController.text;
                  final tituloLongo = _tituloLongoController.text;
                  final pergunta = _perguntaController.text;
                  final resposta = _respostaController.text;

                  if (tituloCurto.isNotEmpty &&
                      tituloLongo.isNotEmpty &&
                      pergunta.isNotEmpty &&
                      resposta.isNotEmpty) {
                    VestibularProvider.of(context).newVestibular(
                      tituloCurto,
                      tituloLongo,
                      pergunta,
                      resposta,
                    );
                    Navigator.pop(context); // Retorna para a tela inicial
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos!')),
                    );
                  }
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
