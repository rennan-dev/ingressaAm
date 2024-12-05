import 'package:flutter/material.dart';
import 'package:entregar/data/vestibular_provider.dart';
import 'package:entregar/screens/detail_screen.dart';

import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    final vestibulares = VestibularProvider.of(context).vestibularList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá Dianne Russell'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vestibulares.length,
        itemBuilder: (context, index) {
          final vestibular = vestibulares[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(vestibular: vestibular),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vestibular.tituloCurto,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    vestibular.tituloLongo,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        backgroundColor: Colors.cyan, // Fundo azul
        child: const Icon(Icons.add, size: 30, color: Colors.white), // Ícone branco
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
