import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

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
