import 'package:flutter/material.dart';

class BoxRoute extends StatelessWidget {
  const BoxRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var redBox = const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            minHeight: 50.0,
          ),
          child: SizedBox(
            height: 5.0,
            child: redBox,
          ),
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            minHeight: 50.0,
          ),
          child: SizedBox(
            height: 80,
            child: redBox,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 50,
          height: 50,
          child: redBox,
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 50, height: 50),
          child: redBox,
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 60.0,
            minHeight: 60.0,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 90.0,
              minHeight: 20.0,
            ),
            child: redBox,
          ),
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 80.0, minHeight: 100.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 10.0, minHeight: 20.0),
                  child: redBox,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Box'),
        actions: const [
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: (BoxRoute()),
      ),
    ),
  ));
}
