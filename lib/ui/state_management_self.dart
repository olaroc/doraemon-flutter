import 'package:flutter/material.dart';

class TapBox extends StatefulWidget {
  const TapBox({Key? key}) : super(key: key);

  @override
  State<TapBox> createState() => _TapBoxState();
}

class _TapBoxState extends State<TapBox> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: _active ? Colors.lightGreen[700] : Colors.grey[600],
              ),
              child: Center(
                child: Text(
                  _active ? 'Active' : 'Inactive',
                  style: const TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
