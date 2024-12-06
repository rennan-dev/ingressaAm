import 'package:flutter/material.dart';

class VestibularCard extends StatefulWidget {
  final String tituloCurto;
  final String tituloLongo;
  final String oQueEh;
  final String quemPodeFazer;
  final String comoSeInscrever;

  VestibularCard(this.tituloCurto, this.tituloLongo, this.oQueEh, this.quemPodeFazer, this.comoSeInscrever, {super.key});

  @override
  State<VestibularCard> createState() => _VestibularCardState();
}

class _VestibularCardState extends State<VestibularCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () async {
          // Ao clicar, navega para a tela de detalhes do vestibular
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VestibularDetalhesScreen(
                tituloCurto: widget.tituloCurto,
                tituloLongo: widget.tituloLongo,
                oQueEh: widget.oQueEh,
                quemPodeFazer: widget.quemPodeFazer,
                comoSeInscrever: widget.comoSeInscrever,
              ),
            ),
          );

          // Verifica se a tela de detalhes retornou algum dado e atualiza a lista
          if (result != null) {
            setState(() {
              // A lista de vestibulares foi modificada. Aqui você pode adicionar um novo vestibular, por exemplo.
              // Isso deve ser tratado dentro do VestibularProvider ou outra lógica de atualização da lista.
            });
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.lightGreen,
              ),
              height: 120,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.tituloCurto,
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.tituloLongo,
                          style: const TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de detalhes para exibir mais informações sobre o vestibular
class VestibularDetalhesScreen extends StatelessWidget {
  final String tituloCurto;
  final String tituloLongo;
  final String oQueEh;
  final String quemPodeFazer;
  final String comoSeInscrever;

  const VestibularDetalhesScreen({
    required this.tituloCurto,
    required this.tituloLongo,
    required this.oQueEh,
    required this.quemPodeFazer,
    required this.comoSeInscrever,
    super.key,
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
        child: ListView(
          children: [
            Text(
              tituloLongo,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'O que é: $oQueEh',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Quem pode fazer: $quemPodeFazer',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Como se inscrever: $comoSeInscrever',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
