import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/vestibular.dart';

class VestibularDetailsScreen extends StatelessWidget {
  const VestibularDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Vestibular vestibular =
    ModalRoute.of(context)?.settings.arguments as Vestibular;

    return Scaffold(
      appBar: AppBar(
        title: Text(vestibular.tituloCurto),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vestibular.tituloLongo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "O que é:\n${vestibular.oQueEh}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Quem pode fazer:\n${vestibular.quemPodeFazer}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Como fazer:\n${vestibular.comoFazer}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Abre o link oficial em um navegador
                // Pode usar a biblioteca `url_launcher` para isso
              },
              child: Text(
                vestibular.linkOficial,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
