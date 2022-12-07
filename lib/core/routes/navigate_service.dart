import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
  NavigatorState? get state => navigatorKey.currentState;

  static Future<dynamic> navigateTo(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> navigateReplaceTo(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  static Future<dynamic> navigateReplaceUntil(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false ,arguments: args);
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
