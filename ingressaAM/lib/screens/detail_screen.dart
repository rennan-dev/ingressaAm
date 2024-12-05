import 'package:flutter/material.dart';

import '../components/vestibular.dart';

class DetailScreen extends StatelessWidget {
  final Vestibular vestibular;

  const DetailScreen({super.key, required this.vestibular});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vestibular.tituloCurto),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vestibular.pergunta,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              vestibular.resposta,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
