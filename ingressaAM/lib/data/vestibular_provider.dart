import 'package:flutter/material.dart';

import '../components/vestibular.dart';

class VestibularProvider extends InheritedWidget {
  VestibularProvider({
    super.key,
    required super.child,
  });

  final List<Vestibular> vestibularList = [
    Vestibular(
      tituloCurto: 'ENEM',
      tituloLongo: 'Exame Nacional do Ensino Médio',
      pergunta: 'O que é o ENEM?',
      resposta: 'O ENEM é...',
    ),
    Vestibular(
      tituloCurto: 'SISU',
      tituloLongo: 'Sistema de Seleção Unificado',
      pergunta: 'Como funciona o SISU?',
      resposta: 'O SISU é...',
    ),

  ];

  newVestibular(String tituloCurto, String tituloLongo, String pergunta, String resposta) {
    vestibularList.add(Vestibular(tituloCurto: tituloCurto, tituloLongo: tituloLongo, pergunta: pergunta, resposta: resposta));
  }

  static VestibularProvider of(BuildContext context) {
    final VestibularProvider? result =
    context.dependOnInheritedWidgetOfExactType<VestibularProvider>();
    assert(result != null, 'No VestibularProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(VestibularProvider oldWidget) {
    return oldWidget.vestibularList.length != vestibularList.length;
  }
}
