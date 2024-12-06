import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/commom/confirmation_dialog.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:flutter_webapi_first_course/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        decoration:
        BoxDecoration(border: Border.all(width: 8), color: Colors.white),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.bookmark,
                    size: 64,
                    color: Colors.brown,
                  ),
                  const Text(
                    "Simple Journal",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("por Alura",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(thickness: 2),
                  ),
                  const Text("Entre ou Registre-se"),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 16,
                    obscureText: true,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        login(context);
                      }, child: const Text("Continuar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  login(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    service.login(
        email: email,
        password: password
    ).then((resultLogin) {
      if(resultLogin) {
        Navigator.pushReplacementNamed(context, "home");
      }
    }).catchError((error) {
      var innerError = error as HttpException;
      showExceptionDialog(context, content: innerError.message);
    }, test: (error) => error is HttpException,
    ).catchError((error){
      showConfirmationDialog(
          context,
          content: "Deseja criar um novo usuário com essas credenciais?",
          affirmativeOption: "Criar"
      ).then((value) {
        if(value!=null && value) {
          service.register(
              email: email,
              password: password
          ).then((resultRegister) {
            if(resultRegister) {
              Navigator.pushReplacementNamed(context, "home");
            }
          });
        }
      });
    }, test: (error) => error is UserNotFoundException,
    
    ).catchError((error){
      showExceptionDialog(context, content: "O servidor demorou para responder, tente novamente mais tarde");
    }, test: (error) => error is TimeoutException);
  }
}