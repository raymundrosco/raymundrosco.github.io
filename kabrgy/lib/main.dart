import 'package:flutter/material.dart';
import 'package:kabrgy/routeGenerator.dart';
// import 'package:kabrgy/screens/announcemenet_screen.dart';
// import 'package:kabrgy/screens/home_screen.dart';
// import 'package:kabrgy/screens/login_screen.dart';
// import 'package:kabrgy/screens/splash_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

void main () {
  runApp(
    MaterialApp(
      title: "kabrgy",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: const Color(0xFF0095E6)
      ),
    )
  );
}