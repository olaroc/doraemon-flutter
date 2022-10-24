import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated button'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined button'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Text button'),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.send),
            onPressed: () {},
            label: const Text('Icon elevated button'),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () {},
            label: const Text('Icon outlined button'),
          ),
          TextButton.icon(
            icon: const Icon(Icons.info),
            onPressed: () {},
            label: const Text('Icon text button'),
          )
        ],
      ),
    );
  }
}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Button widget'),
      ),
      body: const Center(
        child: ButtonWidget(),
      ),
    ),
  ));
}
