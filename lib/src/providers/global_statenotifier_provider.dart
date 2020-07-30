import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/models/models.dart';

class GlobalStateNotifierProvider extends StateNotifier<GlobalStateNotifierModel> {
  final String _keyAlreadyLogin = 'keyAlreadyLogin';
  final String _keyAlreadyOnboarding = 'keyAlreadyOnboarding';
  final String _keyIsDarkMode = 'keyIsDarkMode';

  GlobalStateNotifierProvider([GlobalStateNotifierModel state])
      : super(
          GlobalStateNotifierModel(
            isImageLoading: false,
            isLoading: false,
            isObsecurePassword: false,
            indexBottomNavigation: 0,
            alreadyLogin: false,
            alreadyOnboarding: false,
            isDarkMode: false,
          ),
        );

  void toggleLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void toggleImageLoading(bool value) {
    state = state.copyWith(isImageLoading: value);
  }

  void toggleObsecurePassword(bool value) {
    state = state.copyWith(isObsecurePassword: !value);
  }

  void setCurrentIndexBottomNavigation(int value) {
    state = state.copyWith(indexBottomNavigation: value);
  }

  Future<void> setAlreadyLogin(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = await sharedPreferences.setBool(_keyAlreadyLogin, value);
    print('result Save AlreadyLogin : $result');
  }

  Future<void> setAlreadyOnboarding(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = await sharedPreferences.setBool(_keyAlreadyOnboarding, value);
    print('result Save AlreadyOnboarding : $result');
  }

  Future<void> setDarkModeTheme(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = await sharedPreferences.setBool(_keyIsDarkMode, value);
    state = state.copyWith(isDarkMode: value);

    print('result Save isDarkModeTheme : $result');
  }

  Future<void> getAllSession() async {
    final pref = await SharedPreferences.getInstance();
    final sessionAlreadyLogin = pref.getBool(_keyAlreadyLogin) ?? false;
    final sessionAlreadyOnboarding = pref.getBool(_keyAlreadyOnboarding) ?? false;
    final sessionDarkModeTheme = pref.getBool(_keyIsDarkMode) ?? false;
    state = state.copyWith(
      alreadyLogin: sessionAlreadyLogin,
      alreadyOnboarding: sessionAlreadyOnboarding,
      isDarkMode: sessionDarkModeTheme,
    );
  }
}

final globalStateNotifierProvider =
    StateNotifierProvider<GlobalStateNotifierProvider>((ref) => GlobalStateNotifierProvider());
