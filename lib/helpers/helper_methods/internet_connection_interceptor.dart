import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnection
{
  static CheckInternetConnection? checkInternetConnection;

  static CheckInternetConnection getInstance()
  {
    return checkInternetConnection ??= CheckInternetConnection();
  }

  void startInternetInterceptor(context)
  {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((newState) {
      if(newState == ConnectivityResult.none)
      {}
      else{}
    });
  }
}