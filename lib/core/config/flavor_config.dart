import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src_core_bloc/core/util/enum.dart';

// ignore: must_be_immutable
class FlavorConfig extends InheritedWidget {
  FlavorConfig({
    Key? key,
    required this.appName,
    required this.flavorName,
    required Widget child,
  }): super(key: key, child: child) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception,
            details.stack ?? StackTrace.fromString("stackTraceString"));
      }
    };
  }

  final String appName;
  final FlavorType flavorName;
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => const SizedBox(),
  );

  bool get isDevelopment => flavorName == FlavorType.DEV;

  static FlavorConfig? get instance =>
      Get.context?.dependOnInheritedWidgetOfExactType(aspect: FlavorConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
