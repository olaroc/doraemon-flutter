import 'package:doraemon/ui/named_route.dart';
import 'package:doraemon/ui/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Doraemon',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    onGenerateRoute: (settings) {
      var route = settings.name;
      return MaterialPageRoute(builder: (context) {
        if (Routes.route == route) {
          return NewRoute(
              param:
              ModalRoute.of(context)?.settings.arguments.toString() ?? '');
        } else if (Routes.newNamedRoute == route) {
          return NewNamedRoute(
            param: settings.arguments.toString(),
          );
        } else {
          return const NamedRoute(title: 'Home Page');
        }
      });
    },
    initialRoute: Routes.initial,
  ));
}

