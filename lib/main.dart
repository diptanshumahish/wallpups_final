import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wallpups_final/introscreens/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool showHome;
  MyApp({Key? key, required this.showHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.ibmPlexSansTextTheme().apply()),
      // home: SplashScreen(seen: showHome),
      home: SplashScreen(seen: showHome),
    );
  }
}
