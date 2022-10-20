import 'package:flutter/material.dart';

class RouteTest extends StatefulWidget {
  const RouteTest({Key? key}) : super(key: key);

  @override
  State<RouteTest> createState() => _RouteTestState();
}

class _RouteTestState extends State<RouteTest> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result),
          ElevatedButton(
            onPressed: () {
              _navToNewRoute(context);
            },
            child: const Text("New route"),
          )
        ],
      ),
    );
  }

  void _navToNewRoute(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewRoute(param: 'hi')),
    );
    setState(() {
      this.result = result.toString();
    });
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({Key? key, required this.param}) : super(key: key);

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
            Text('params=$param'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'result');
              },
              child: const Text('result'),
            )
          ],
        ),
      ),
    );
  }
}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Route test'),
      ),
      body: const RouteTest(),
    ),
  ));
}
