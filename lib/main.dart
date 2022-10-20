import 'package:doraemon/ui/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Route test'),
      ),
      body: const RouteTest(),
    ),
  ));
}

