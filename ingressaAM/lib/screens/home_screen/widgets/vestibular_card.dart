import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/vestibular.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:flutter_webapi_first_course/services/vestibular_service.dart';

class VestibularCard extends StatelessWidget {
  final Vestibular vestibular;
  final Function refreshFunction;
  final String token;

  const VestibularCard({
    Key? key,
    required this.vestibular,
    required this.refreshFunction,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          'vestibular-details',
          arguments: vestibular,
        ).then((value) {
          refreshFunction();
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            vestibular.tituloCurto,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            vestibular.oQueEh,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
