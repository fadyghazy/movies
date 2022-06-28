import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/screens/homescreen.dart';

void main() {
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
          ,primarySwatch: Colors.blue,
        ),
        home:HomeScreen()
    );
  }
}


