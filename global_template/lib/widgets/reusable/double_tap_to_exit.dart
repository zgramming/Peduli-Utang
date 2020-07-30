import 'package:global_template/global_template.dart';

class DoubleTapToExit {
  DateTime _currentBackPressTime;
  Future<bool> doubleTapToExit() async {
    var now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      await GlobalFunction().showToast(message: 'Tekan Lagi Untuk Keluar');
      print('Press Again To Close Application');
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

final doubleTapToExit = DoubleTapToExit();
