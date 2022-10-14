import 'dart:developer';

import 'package:flutter/material.dart';

class GetStateWidget extends StatefulWidget {
  const GetStateWidget({Key? key}) : super(key: key);

  @override
  State<GetStateWidget> createState() => _GetStateWidgetState();
}

class _GetStateWidgetState extends State<GetStateWidget> {
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  // 无法通过 build 函数的 context 获取到 ScaffoldState，因为只能向上查找
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text('Get State object'),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(
              // 该 context 由父 Widget 提供
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    // 这里不能用最上面的 context
                    // 所以要通过 Builder 提供的 context
                    var state = context.findAncestorStateOfType<ScaffoldState>()
                        as ScaffoldState;
                    state.openDrawer();
                  },
                  child: const Text('Open the drawer 1'),
                );
              },
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  var state = Scaffold.of(context);
                  state.openDrawer();
                },
                child: const Text('Open the drawer 2'),
              );
            }),

            // 不建议
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
                child: const Text('Open the drawer 3'),
              );
            }),

            //  Scaffold.of() called with a context that does not contain a Scaffold. must use a builder.
            //  ElevatedButton(onPressed: (){
            //  var state = Scaffold.of(context);
            //  state.openDrawer();
            // },
            // child: const Text('Open the drawer 2'),
            // ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('This is a snackBar'),
                    ));
                  },
                  child: const Text('Show snackBar'),
                );
              },
            )
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

void run() {
  runApp(const MaterialApp(
    home: GetStateWidget(),
  ));
}
