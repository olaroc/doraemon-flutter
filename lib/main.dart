import 'dart:async';

import 'package:doraemon/ui/named_route.dart';
import 'package:doraemon/ui/route.dart';
import 'package:doraemon/ui/widgets/widget_box.dart';
import 'package:doraemon/ui/widgets/widget_button.dart';
import 'package:doraemon/ui/widgets/widget_icon.dart';
import 'package:doraemon/ui/widgets/widget_image.dart';
import 'package:doraemon/ui/widgets/widget_indicator.dart';
import 'package:doraemon/ui/widgets/widget_switch_checkbox.dart';
import 'package:doraemon/ui/widgets/widget_text.dart';
import 'package:doraemon/ui/widgets/widget_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  var onError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details);
    _reportError(details);
  };
  runZoned(() => run(),
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          _reportLog(line);
        },
        handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
            Object error, StackTrace stackTrace) {
          _reportUncaughtError(error);
        },
      ));
}

void _reportUncaughtError(Object error) {}

void _reportLog(String line) {}

void _reportError(FlutterErrorDetails details) {}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Box'),
      ),
      body: const Center(
        child: (BoxRoute()),
      ),
    ),
  ));
}
