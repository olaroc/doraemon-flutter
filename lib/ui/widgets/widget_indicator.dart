import 'package:flutter/material.dart';

class IndicatorRoute extends StatefulWidget {
  const IndicatorRoute({Key? key}) : super(key: key);

  @override
  State<IndicatorRoute> createState() => _IndicatorRouteState();
}

class _IndicatorRouteState extends State<IndicatorRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )
      ..forward()
      ..addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
          ),
          const Spacer(),
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          const Spacer(),
          // todo: not working
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: _animationController.drive(ColorTween(
              begin: Colors.grey,
              end: Colors.green,
            )),
          ),
          const Spacer(),
          // not working for LinearProgressIndicator
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
          ),
          const Spacer(),
          CircularProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
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
        title: const Text('Indicator'),
      ),
      body: const Center(
        child: (IndicatorRoute()),
      ),
    ),
  ));
}
