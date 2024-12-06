import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/vestibular.dart';
import 'package:flutter_webapi_first_course/services/vestibular_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commom/exception_dialog.dart';
import '../../helpers/logout.dart';

class AddVestibularScreen extends StatelessWidget {
  final Vestibular vestibular;
  final bool isEditing;

  AddVestibularScreen({super.key, required this.vestibular, required this.isEditing});

  final TextEditingController _titleShortController = TextEditingController();
  final TextEditingController _titleLongController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _whoCanDoController = TextEditingController();
  final TextEditingController _howToDoController = TextEditingController();
  final TextEditingController _officialLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleShortController.text = vestibular.tituloCurto;
    _titleLongController.text = vestibular.tituloLongo;
    _descriptionController.text = vestibular.oQueEh;
    _whoCanDoController.text = vestibular.quemPodeFazer;
    _howToDoController.text = vestibular.comoFazer;
    _officialLinkController.text = vestibular.linkOficial;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Vestibular' : 'Adicionar Vestibular'),
        actions: [
          IconButton(
            onPressed: () {
              registerVestibular(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(_titleShortController, 'Título Curto'),
              const SizedBox(height: 16),
              buildTextField(_titleLongController, 'Título Longo'),
              const SizedBox(height: 16),
              buildTextField(_descriptionController, 'Descrição', multiline: true),
              const SizedBox(height: 16),
              buildTextField(_whoCanDoController, 'Quem Pode Fazer'),
              const SizedBox(height: 16),
              buildTextField(_howToDoController, 'Como Fazer', multiline: true),
              const SizedBox(height: 16),
              buildTextField(_officialLinkController, 'Link Oficial'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText, {bool multiline = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(fontSize: 16),
      keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
      maxLines: multiline ? null : 1,
    );
  }

  void registerVestibular(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");
      if (token != null) {
        vestibular.tituloCurto = _titleShortController.text.trim();
        vestibular.tituloLongo = _titleLongController.text.trim();
        vestibular.oQueEh = _descriptionController.text.trim();
        vestibular.quemPodeFazer = _whoCanDoController.text.trim();
        vestibular.comoFazer = _howToDoController.text.trim();
        vestibular.linkOficial = _officialLinkController.text.trim();

        VestibularService service = VestibularService();

        if (isEditing) {
          service.edit(vestibular.id, vestibular, token).then((value) {
            Navigator.pop(context, value);
          }).catchError((error) {
            logout(context);
          }, test: (error) => error is TokenNotValidException).catchError((error) {
            var innerError = error as HttpException;
            showExceptionDialog(context, content: innerError.message);
          }, test: (error) => error is HttpException);
        } else {
          service.register(vestibular, token).then((value) {
            Navigator.pop(context, value);
          }).catchError((error) {
            logout(context);
          }, test: (error) => error is TokenNotValidException).catchError((error) {
            var innerError = error as HttpException;
            showExceptionDialog(context, content: innerError.message);
          }, test: (error) => error is HttpException);
        }
      }
    });
  }
}
