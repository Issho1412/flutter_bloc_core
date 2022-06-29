import 'package:intl/intl.dart';
import '../connection/networkConnectivity.dart';

class Helper {
  Helper._();
  Future<bool> checkNetwork() async {
    final NetworkInfo _networkInfo = NetworkInfo();
    if (await _networkInfo.isConnected) {
      return true;
    } else {
      // showToast('network_error'.tr, ToastType.fail);
      return false;
    }
  }

  Future delay(int second) async {
    await Future.delayed(Duration(seconds: second));
  }

  String formatDate(DateTime date, [String? formatString]) {
    return DateFormat(formatString ?? 'yyyy年MM月dd日(E)', 'ja,JP').format(date);
  }
}