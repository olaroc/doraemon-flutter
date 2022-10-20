import 'package:doraemon/ui/route.dart';
import 'package:flutter/material.dart';

class NamedRoute extends StatefulWidget {
  const NamedRoute({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NamedRoute> createState() => _NamedRouteState();
}

class _NamedRouteState extends State<NamedRoute> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result),
              ElevatedButton(
                onPressed: () {
                  _navToNewRoute(context);
                },
                child: const Text('New route'),
              )
            ],
          ),
        ));
  }

  void _navToNewRoute(BuildContext context) async {
    var result = await Navigator.pushNamed(context, Routes.newNamedRoute,
        arguments: 'hi');
    setState(() {
      this.result = result.toString();
    });
  }
}

class NewNamedRoute extends StatelessWidget {
  const NewNamedRoute({Key? key, required this.param}) : super(key: key);

  final String param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(param),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'hello');
              },
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}

class Routes {
  static const initial = '/';
  static const route = 'new_route';
  static const newNamedRoute = 'new_named_route';
}

void run() {
  runApp(MaterialApp(
    title: 'Doraemon',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    onGenerateRoute: (routeSettings) {},
    initialRoute: Routes.initial,
    routes: {
      Routes.initial: (context) => const NamedRoute(title: 'Home page'),
      Routes.route: (context) => NewRoute(
          param: ModalRoute.of(context)?.settings.arguments.toString() ?? ''),
      Routes.newNamedRoute: (context) => NewNamedRoute(
            param: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
          ),
    },
  ));
}

void runGenerateRoute() {
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
              param: settings.arguments.toString());
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
