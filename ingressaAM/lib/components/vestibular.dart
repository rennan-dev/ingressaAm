import 'package:flutter/material.dart';

class VestibularCard extends StatefulWidget {
  final String tituloCurto;
  final String tituloLongo;
  // final String oQueEh;
  // final String quemPodeFazer;
  // final String comoSeInscrever;

  VestibularCard(this.tituloCurto, this.tituloLongo, {super.key});

  int life = 10;

  @override
  State<VestibularCard> createState() => _VestibularCardState();
}

class _VestibularCardState extends State<VestibularCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.lightGreen,), height: 140,
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
          )
        ],
      ),
    );
  }
}
