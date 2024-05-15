// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:kabrgy/screens/announcemenet_screen.dart';
import 'package:kabrgy/screens/commentsmodal.dart';
import 'package:kabrgy/screens/compliance_list_screen.dart';
import 'package:kabrgy/screens/compliance_screen.dart';
import 'package:kabrgy/screens/home_screen.dart';
import 'package:kabrgy/screens/login_screen.dart';
import 'package:kabrgy/screens/module_list_screen.dart';
import 'package:kabrgy/screens/module_screen.dart';
import 'package:kabrgy/screens/register_screen.dart';
import 'package:kabrgy/screens/splash_screen.dart';
import 'package:kabrgy/screens/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash(),);
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const Welcome(),);
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home(),);
      case '/moduleList':
        return MaterialPageRoute(builder: (_) => const ModuleList());
      case '/module':
        return MaterialPageRoute(builder: (_) => const ModuleScreen());
      case '/complianceList':
        return MaterialPageRoute(builder: (_) => const ComplianceList());
      case '/compliance':
        return MaterialPageRoute(builder: (_) => const ComplianceScreen());
      case '/announcement':
        return MaterialPageRoute(builder: (_) => const AnnouncementScreen(),);
      case '/comments':
        return MaterialPageRoute(builder: (_) => CommentsModal(),);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}