import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      home: SafeArea(
          child: Material(
        child: Column(
          children: [
            MyAppbar(
                title: Text(
              'basic widgets',
              style: Theme.of(context).primaryTextTheme.headline6,
            )),
            const Expanded(
              child: Center(
                child: Text('hello world'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
