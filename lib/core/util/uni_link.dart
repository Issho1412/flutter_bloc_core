import 'dart:async';
import 'dart:developer';
import 'package:uni_links/uni_links.dart';

class UniversalLink {
  static UniversalLink? _instance;
  UniversalLink._();
  StreamSubscription? _sub;

  static UniversalLink get instance => _instance ??= UniversalLink._();

  Future<bool> initUniLinks() async {
    try {
      final uri = await getInitialLink();
      if (uri == null) {
        log('uri null');
      } else {
        // await Helper.resolveLink(uri);
        // ... doing something to direct view in app
        streamUniLink();
        return true;
      }
      streamUniLink();
      return false;
    } catch (e) {
      log('error: $e');
      return false;
    }
  }

  Future<void> streamUniLink() async {
    _sub = linkStream.listen((String? link) async {
      if (link != null) {
        // await Helper.resolveLink(link);
        // ... doing something to direct view in app
      }
    }, onError: (err) {
      log('error: $err');
    });
  }

  void cancel() {
    _sub?.cancel();
  }
}
