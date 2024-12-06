import 'package:flutter/material.dart';

import '../../../models/vestibular.dart';

class VestibularCard extends StatelessWidget {
  final Vestibular vestibular;

  const VestibularCard({Key? key, required this.vestibular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(vestibular.tituloCurto),
        subtitle: Text(vestibular.tituloLongo),
        onTap: () {
          // Ao clicar no vestibular, você pode navegar para outra tela com mais detalhes
        },
      ),
    );
  }
}
