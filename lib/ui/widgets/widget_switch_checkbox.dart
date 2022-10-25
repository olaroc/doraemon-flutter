import 'package:flutter/material.dart';

class SwitchAndCheckboxWidget extends StatefulWidget {
  const SwitchAndCheckboxWidget({Key? key}) : super(key: key);

  @override
  State<SwitchAndCheckboxWidget> createState() =>
      _SwitchAndCheckboxWidgetState();
}

class _SwitchAndCheckboxWidgetState extends State<SwitchAndCheckboxWidget> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  value: _switchSelected,
                  onChanged: (selected) {
                    setState(() {
                      _switchSelected = selected;
                    });
                  }),
              Text(_switchSelected ? '开' : '关')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red,
                  tristate: false,
                  onChanged: (selected) {
                    setState(() {
                      _checkboxSelected = selected ?? false;
                    });
                  }),
              Text(_checkboxSelected ? '选中' : '未选中'),
            ],
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
        title: const Text('Switch and checkbox widget'),
      ),
      body: const Center(
        child: SwitchAndCheckboxWidget(),
      ),
    ),
  ));
}
