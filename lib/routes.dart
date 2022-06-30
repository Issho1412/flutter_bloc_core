import 'package:src_core_bloc/pages/memes/index.dart';
import 'package:flutter/material.dart';
import 'core/config/create_page_route.dart';

class RouteList {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    var data = settings.arguments;

    switch (settings.name) {
      case memeRoute: return createRoute(const MemePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('${settings.name}'))));
    }
  }
}

// ------ Route List Constants ------- 
const memeRoute = '/Meme';
const demoRoute = '/Demo';
const splashRoute = '/Splash';

const loginRoute = '/Login';
const loginSuccessRoute = '/LoginSuccess';
const forgotRoute = '/ForgotPassword';
const registerRoute = '/Register';

const homeRoute = '/Home';
const productRoute = '/Product';
const profileRoute = '/Profile';
const cartRoute = '/Cart';
const otpRoute = '/Otp';
const webviewRoute = '/Webview';
const qrcodeRoute = '/QRCode';

const trimvideoRoute = '/TrimVideo';