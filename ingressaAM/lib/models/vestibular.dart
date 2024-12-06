import 'package:uuid/uuid.dart';

class Vestibular {
  String id;
  String tituloCurto;
  String tituloLongo;
  String oQueEh;
  String quemPodeFazer;
  String comoFazer;
  String linkOficial;

  Vestibular({
    required this.id,
    required this.tituloCurto,
    required this.tituloLongo,
    required this.oQueEh,
    required this.quemPodeFazer,
    required this.comoFazer,
    required this.linkOficial,
  });


  Vestibular.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        tituloCurto = map["titulo_curto"],
        tituloLongo = map["titulo_longo"],
        oQueEh = map["o_que_eh"],
        quemPodeFazer = map["quem_pode_fazer"],
        comoFazer = map["como_fazer"],
        linkOficial = map["link_oficial"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo_curto": tituloCurto,
      "titulo_longo": tituloLongo,
      "o_que_eh": oQueEh,
      "quem_pode_fazer": quemPodeFazer,
      "como_fazer": comoFazer,
      "link_oficial": linkOficial,
    };
  }

  @override
  String toString() {
    return """
      Título Curto: $tituloCurto
      Título Longo: $tituloLongo
      O que é: $oQueEh
      Quem pode fazer: $quemPodeFazer
      Como fazer: $comoFazer
      Link oficial: $linkOficial
    """;
  }
}
