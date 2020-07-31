import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/apis/apis.dart';
import '../../network/models/user/user_google_model.dart';

class UserProvider extends StateNotifier<UserGoogleModel> {
  UserProvider([UserGoogleModel state])
      : super(
          UserGoogleModel(
            createdDate: DateTime.now(),
            emailUser: 'unknown@gmail.com',
            idUser: 'Unknown',
            imageUser: 'unkwnon',
            nameUser: 'unknown',
            tokenFcm: 'unknown',
            allowUtang: '1',
          ),
        );

  final _userGoogleApi = UserGoogleApi();
  final _googleSignIn = GoogleSignIn();
  final _userSPKey = 'userKey';

  UserGoogleModel get initialState => state;

  Future<void> validateUser({
    @required GoogleSignInAccount googleAccount,
    @required String tokenFCM,
  }) async {
    final result = await _userGoogleApi.validateUser(
      idUser: googleAccount.id,
      nameUser: googleAccount.displayName,
      emailUser: googleAccount.email,
      imageUser: googleAccount.photoUrl,
      tokenFCM: tokenFCM,
    );
    state = result;
    await saveUser(state);
  }

  Future<void> signOutWithGoogle() async {
    await _googleSignIn.signOut();
    state = UserGoogleModel();
  }

  Future<UserGoogleModel> searchUserByIdOrEmail({
    String idUser,
    String emailuser,
    String idOrEmail = 'email_user',
  }) async {
    final result = await _userGoogleApi.getUserByIdOrEmail(
      idUser: idUser,
      emailUser: emailuser,
      idOrEmail: idOrEmail,
    );
    UserGoogleModel temp;
    for (var item in result) {
      temp = item;
    }

    return temp;
  }

  Future<void> saveUser(UserGoogleModel value) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString(_userSPKey, jsonEncode(value));
    print('Result Save User $result');
  }

  Future<void> readUser() async {
    final pref = await SharedPreferences.getInstance();
    final getEncodeSession = pref.getString(_userSPKey);
    print('Mendapatkan getEncodeSession $getEncodeSession');
    if (getEncodeSession == null) {
      return;
    }
    final Map result = json.decode(getEncodeSession);
    final user = UserGoogleModel.fromJson(result);
    state = user;
  }

  Future<void> updateAllowUtang(String value) async {
    final result = await _userGoogleApi.updateAllowUtang(idUser: state.idUser, allowUtang: value);
    await saveUser(result);
    state = state.copyWith(allowUtang: value);
  }
}

final userProvider = StateNotifierProvider((ref) => UserProvider());
