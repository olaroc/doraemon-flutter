import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.0,
        height: 1.2,
        overflow: TextOverflow.ellipsis,
        background: Paint()..color = Colors.yellow,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed,
      ),
      textAlign: TextAlign.start,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Text Widget',
            maxLines: 1,
          ),
          Text.rich(
            TextSpan(
                children: const [
                  TextSpan(text: 'Home: '),
                  TextSpan(
                    text: 'https://github.com',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
                style: TextStyle(
                  background: Paint()..color = Colors.white,
                )),
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
        title: const Text('Text widget'),
      ),
      body: const Center(
        child: TextWidget(),
      ),
    ),
  ));
}
