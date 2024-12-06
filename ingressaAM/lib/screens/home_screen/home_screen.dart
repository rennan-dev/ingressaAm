import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/home_screen_list.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/vestibular_card.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/logout.dart';
import '../../models/journal.dart';
import '../../models/vestibular.dart';
import '../../services/vestibular_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista de vestibulares
  List<Vestibular> vestibulares = [];

  final ScrollController _listScrollController = ScrollController();

  VestibularService service = VestibularService();

  int? userId;
  String? userToken;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vestibulares | ${currentDay.day} / ${currentDay.month} / ${currentDay.year}"),
        actions: [
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                logout(context);
              },
              title: const Text("Sair"),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
        body: (userToken != null)
            ? ListView.builder(
          itemCount: vestibulares.length,
          itemBuilder: (context, index) {
            final vestibular = vestibulares[index];
            return VestibularCard(
              vestibular: vestibular,
              refreshFunction: refresh,
              token: userToken!,
            );
          },
        )
            : const Center(child: CircularProgressIndicator()),
    );
  }

  void refresh() async {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");
      String? email = prefs.getString("email");
      int? id = prefs.getInt("id");

      if (token != null && email != null && id != null) {
        setState(() {
          userId = id;
          userToken = token;
        });

        // Carregar vestibulares
        service.getAll(token: token).then((List<Vestibular> listVestibulares) {
          setState(() {
            vestibulares = listVestibulares;
          });
        });
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    }).catchError((error) {
      logout(context);
    });
  }
}
