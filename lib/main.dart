import 'dart:async';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import './src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  // runApp(ProviderScope(child: MyApp()));
// Crashlytics.instance.enableInDevMode = true;
// Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZoned(
    () => runApp(ProviderScope(child: MyApp())),
    onError: Crashlytics.instance.recordError,
  );
}
