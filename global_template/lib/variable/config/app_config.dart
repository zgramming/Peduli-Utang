class AppConfig {
  String urlApk = 'https://sinergics.net/building/apps';

  // final Map<String, String> headersApi = {'Content-Type': 'application/x-www-form-urlencoded'};
  final Map<String, String> headersApi = {'Accept': 'application/json'};
  final serverTokenFirebase =
      'AAAAFU5dafk:APA91bGx90l0Gb1WM0L4ejKr7TXjKS78J0nDZmFTOnaxw9h_gXlrlv6kU38wHxyMRTwQynLG9sKvdfJ1ZTIEZxIyhlFgzK--VIcGHC2QOXPr0YizOa2wS5RRyIKTIXunhr-Bi9mWz7_U';

  final String baseApiUrl = 'http://www.zimprov.id/peduli_utang/api';

  final String baseImageApiUrl = 'http://www.zimprov.id/peduli_utang/images';
  final String baseImageApiUtangUrl = 'http://www.zimprov.id/peduli_utang/images/utang';

  final String indonesiaLocale = 'id_ID';

  final String userGoogleController = 'User_google';
  final String utangController = 'Utang';
  final String historyController = 'History';

  static const urlImageAsset = 'asset/images';
  static const defaultImageNetwork = 'https://flutter.io/images/catalog-widget-placeholder.png';
}

final appConfig = AppConfig();
