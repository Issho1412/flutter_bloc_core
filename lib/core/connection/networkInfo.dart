// ignore_for_file: file_names

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> get isConnected async =>
      (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
}
