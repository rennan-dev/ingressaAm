import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/vestibular_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/logout.dart';
import '../../models/vestibular.dart';
import '../../services/vestibular_service.dart';
import '../add_vestibular_screen/add_vestibular_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentDay = DateTime.now();
  int windowPage = 10;
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
        controller: _listScrollController,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF98F5F9),
        onPressed: () {
          navigateToAddVestibular();
        },
        child: const Icon(Icons.add, color: Colors.black,),
        tooltip: 'Adicionar Vestibular',
      ),
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

  void navigateToAddVestibular() async {
    final newVestibular = Vestibular(
      id: '',
      tituloCurto: '',
      oQueEh: '', tituloLongo: '', quemPodeFazer: '', comoFazer: '', linkOficial: '',
    );

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddVestibularScreen(
          vestibular: newVestibular,
          isEditing: false,
        ),
      ),
    );
    refresh();
  }
}
