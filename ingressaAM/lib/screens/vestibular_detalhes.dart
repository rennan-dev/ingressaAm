import 'package:flutter/material.dart';

class VestibularDetalhesScreen extends StatelessWidget {
  final String tituloCurto;
  final String tituloLongo;
  final String oQueEh;
  final String quemPodeFazer;
  final String comoSeInscrever;

  const VestibularDetalhesScreen({
    super.key,
    required this.tituloCurto,
    required this.tituloLongo,
    required this.oQueEh,
    required this.quemPodeFazer,
    required this.comoSeInscrever,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloCurto),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título Completo: $tituloLongo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('O que é: $oQueEh'),
            const SizedBox(height: 10),
            Text('Quem pode fazer: $quemPodeFazer'),
            const SizedBox(height: 10),
            Text('Como se inscrever: $comoSeInscrever'),
          ],
        ),
      ),
    );
  }
}
