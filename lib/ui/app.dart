import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_test/ui/home.dart';
import 'package:web_test/ui/responsive_layout.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      home: const Home(),
    );
  }
}
