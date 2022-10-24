import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.accessible,
            color: Colors.green,
          ),
          Icon(
            Icons.error,
            color: Colors.green,
          ),
          Icon(
            Icons.fingerprint,
            color: Colors.green,
          ),
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
        child: IconWidget(),
      ),
    ),
  ));
}
