import 'package:entregar/components/vestibular.dart';
import 'package:flutter/material.dart';

class VestibularProvider extends InheritedWidget {
  VestibularProvider({
    super.key,
    required super.child,
  });

  final List<VestibularCard> vestibularList = [
    VestibularCard(
      'ENEM',
      'Exame Nacional do Ensino Médio',
      'O ENEM é uma prova para avaliar o desempenho do estudante no ensino médio.',
      'Estudantes que completaram o ensino médio ou estão em fase de conclusão.',
      'A inscrição é realizada pela internet no site do INEP.',
    ),
    VestibularCard(
      'SISU',
      'Sistema de Seleção Unificada',
      'O SISU é um sistema de seleção para universidades públicas baseado na nota do ENEM.',
      'Quem fez o ENEM no ano anterior e obteve a nota mínima exigida.',
      'As inscrições são realizadas online no site do SISU.',
    ),
    VestibularCard(
      'PSIU',
      'Processo Seletivo Unificado',
      'O PSIU é um vestibular único para várias universidades do estado.',
      'Estudantes que concluíram ou estão em fase de concluir o ensino médio.',
      'A inscrição deve ser feita online nos sites das universidades participantes.',
    ),
    VestibularCard(
      'PSS',
      'Processo Seletivo Seriado',
      'O PSS é um tipo de vestibular que aplica provas a cada ano do ensino médio.',
      'Estudantes do ensino médio, dependendo do ano de escolaridade.',
      'A inscrição deve ser feita no site da instituição organizadora do PSS.',
    ),
  ];

  void newVestibular(String tituloCurto, String tituloLongo, String oQueEh, String quemPodeFazer, String comoSeInscrever) {
    vestibularList.add(VestibularCard(tituloCurto, tituloLongo, oQueEh, quemPodeFazer, comoSeInscrever));
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