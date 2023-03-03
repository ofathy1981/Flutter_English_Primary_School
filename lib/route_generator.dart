import 'package:flutter/material.dart';
import 'package:primary_secondery_english/main.dart';
import 'package:primary_secondery_english/a_to_m.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // case '/':
      //           return MaterialPageRoute(builder: (_) => MyHomePage());
      // case'/anim':
      //   return MaterialPageRoute(builder: (_) => MyStatefulWidget());

      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case'/words':
        return MaterialPageRoute(builder: (_) => MyHomePage2());

      case'/allwords':
        return MaterialPageRoute(builder: (_) => MyHomePage3());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}