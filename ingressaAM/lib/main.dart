import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/add_vestibular_screen/add_vestibular_screen.dart';
import 'package:flutter_webapi_first_course/screens/login_screen/login_screen.dart';
import 'package:flutter_webapi_first_course/screens/vestibular_details_screen/vestibular_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/vestibular.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLogged = await verifyToken();
  runApp(MyApp(isLogged: isLogged,));
}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? token = prefs.getString("accessToken");

  if(token!=null) {
    return true;
  }
  return false;
}


class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingressa AM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF98F5F9),
          titleTextStyle: TextStyle(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: GoogleFonts.bitterTextTheme()
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: (isLogged)? "home":"login",
      routes: {
        "home": (context) => const HomeScreen(),
        "login": (context) => LoginScreen(),
        'vestibular-details': (context) => const VestibularDetailsScreen(),
        'add-vestibular': (context) => AddVestibularScreen(
          vestibular: ModalRoute.of(context)!.settings.arguments as Vestibular,
          isEditing: false, // ou true se for edição
        ),
      },
    );
  }
}
