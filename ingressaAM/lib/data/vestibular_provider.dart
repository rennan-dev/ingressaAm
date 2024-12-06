import 'package:entregar/components/vestibular.dart';
import 'package:flutter/material.dart';

class VestibularProvider extends InheritedWidget {
  VestibularProvider({
    super.key,
    required super.child,
  });

  final List<VestibularCard> vestibularList = [
    VestibularCard('ENEM', 'Exame Nacional do Ensino Médio'),
    VestibularCard('SISU', 'Sistema de Seleção Unificada'),
    VestibularCard('PSIU', 'Processo Seletivo Unificado'),
    VestibularCard('PSS', 'Processo Seletivo Seriado'),
  ];

  void newPersonagem(String tituloCurto, String tituloLongo) {
    vestibularList.add(VestibularCard(tituloCurto, tituloLongo));
  }

  static VestibularProvider of(BuildContext context) {
    final VestibularProvider? result =
        context.dependOnInheritedWidgetOfExactType<VestibularProvider>();
    assert(result != null, 'No PersonagemProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(VestibularProvider oldWidget) {
    return oldWidget.vestibularList.length != vestibularList.length;
  }
}