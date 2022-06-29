import 'package:flutter/cupertino.dart';

Route createRoute(Widget widget) {
  return PageRouteBuilder(
    transitionsBuilder: (
      BuildContext context, 
      Animation<double> animation,
      Animation<double> setAnimation,
      Widget child
    ){   
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => widget
  );
}