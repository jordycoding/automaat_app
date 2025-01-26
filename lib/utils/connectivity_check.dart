import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnectivity([Function()? callback]) async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  final check = (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet));
  if (!check) {
    if (callback != null) {
      callback();
    }
  }
  return check;
}
