import 'package:flutter/material.dart';

class TapBox extends StatefulWidget {
  const TapBox({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapBox> createState() => _TapBoxState();
}

class _TapBoxState extends State<TapBox> {
  bool _highLight = false;

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _onTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    setState(() {
      widget.onChanged(!widget.active);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onDoubleTapCancel: _onTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highLight ? Border.all(
            color: Colors.teal,
            width: 10.0,
          ) : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapBoxChanged(bool state) {
    setState(() {
      _active = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TapBox(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      ),
    );
  }
}

void run() {
  runApp(const MaterialApp(
    home: ParentWidget(),
  ));
}
