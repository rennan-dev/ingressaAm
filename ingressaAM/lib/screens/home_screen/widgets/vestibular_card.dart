import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/vestibular.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:flutter_webapi_first_course/services/vestibular_service.dart';

import '../../../helpers/logout.dart';
import '../../commom/confirmation_dialog.dart';

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
          trailing: Container(child: IconButton(onPressed: (){
            removeVestibular(context);
          }, icon: const Icon(Icons.delete)),),
        ),
      ),
    );
  }


  removeVestibular(BuildContext context) {
    VestibularService vestibularService = VestibularService();

    if(vestibular!=null) {
      showConfirmationDialog(context).then((value) {
        if(value!=null) {
          if(value) {
            vestibularService.delete(vestibular!.id, token).then((value) {
              if(value) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Vestibular apagado com sucesso")));
                refreshFunction();
              }
            }).catchError((error){
              logout(context);
            }, test: (error) => error is TokenNotValidException,

            ).catchError((error) {
              var innerError = error as HttpException;
              showExceptionDialog(context, content: innerError.message);
            }, test: (error) => error is HttpException);
          }else {

          }
        }
      });
    }
  }
}
