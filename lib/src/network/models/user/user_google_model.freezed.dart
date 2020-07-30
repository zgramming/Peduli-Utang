// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_google_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserGoogleModel _$UserGoogleModelFromJson(Map<String, dynamic> json) {
  return _UserGoogleModel.fromJson(json);
}

class _$UserGoogleModelTearOff {
  const _$UserGoogleModelTearOff();

// ignore: unused_element
  _UserGoogleModel call(
      {String idUser,
      String nameUser,
      String emailUser,
      String imageUser,
      String tokenFcm,
      DateTime createdDate}) {
    return _UserGoogleModel(
      idUser: idUser,
      nameUser: nameUser,
      emailUser: emailUser,
      imageUser: imageUser,
      tokenFcm: tokenFcm,
      createdDate: createdDate,
    );
  }
}

// ignore: unused_element
const $UserGoogleModel = _$UserGoogleModelTearOff();

mixin _$UserGoogleModel {
  String get idUser;
  String get nameUser;
  String get emailUser;
  String get imageUser;
  String get tokenFcm;
  DateTime get createdDate;

  Map<String, dynamic> toJson();
  $UserGoogleModelCopyWith<UserGoogleModel> get copyWith;
}

abstract class $UserGoogleModelCopyWith<$Res> {
  factory $UserGoogleModelCopyWith(
          UserGoogleModel value, $Res Function(UserGoogleModel) then) =
      _$UserGoogleModelCopyWithImpl<$Res>;
  $Res call(
      {String idUser,
      String nameUser,
      String emailUser,
      String imageUser,
      String tokenFcm,
      DateTime createdDate});
}

class _$UserGoogleModelCopyWithImpl<$Res>
    implements $UserGoogleModelCopyWith<$Res> {
  _$UserGoogleModelCopyWithImpl(this._value, this._then);

  final UserGoogleModel _value;
  // ignore: unused_field
  final $Res Function(UserGoogleModel) _then;

  @override
  $Res call({
    Object idUser = freezed,
    Object nameUser = freezed,
    Object emailUser = freezed,
    Object imageUser = freezed,
    Object tokenFcm = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: idUser == freezed ? _value.idUser : idUser as String,
      nameUser: nameUser == freezed ? _value.nameUser : nameUser as String,
      emailUser: emailUser == freezed ? _value.emailUser : emailUser as String,
      imageUser: imageUser == freezed ? _value.imageUser : imageUser as String,
      tokenFcm: tokenFcm == freezed ? _value.tokenFcm : tokenFcm as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

abstract class _$UserGoogleModelCopyWith<$Res>
    implements $UserGoogleModelCopyWith<$Res> {
  factory _$UserGoogleModelCopyWith(
          _UserGoogleModel value, $Res Function(_UserGoogleModel) then) =
      __$UserGoogleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idUser,
      String nameUser,
      String emailUser,
      String imageUser,
      String tokenFcm,
      DateTime createdDate});
}

class __$UserGoogleModelCopyWithImpl<$Res>
    extends _$UserGoogleModelCopyWithImpl<$Res>
    implements _$UserGoogleModelCopyWith<$Res> {
  __$UserGoogleModelCopyWithImpl(
      _UserGoogleModel _value, $Res Function(_UserGoogleModel) _then)
      : super(_value, (v) => _then(v as _UserGoogleModel));

  @override
  _UserGoogleModel get _value => super._value as _UserGoogleModel;

  @override
  $Res call({
    Object idUser = freezed,
    Object nameUser = freezed,
    Object emailUser = freezed,
    Object imageUser = freezed,
    Object tokenFcm = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_UserGoogleModel(
      idUser: idUser == freezed ? _value.idUser : idUser as String,
      nameUser: nameUser == freezed ? _value.nameUser : nameUser as String,
      emailUser: emailUser == freezed ? _value.emailUser : emailUser as String,
      imageUser: imageUser == freezed ? _value.imageUser : imageUser as String,
      tokenFcm: tokenFcm == freezed ? _value.tokenFcm : tokenFcm as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_UserGoogleModel implements _UserGoogleModel {
  const _$_UserGoogleModel(
      {this.idUser,
      this.nameUser,
      this.emailUser,
      this.imageUser,
      this.tokenFcm,
      this.createdDate});

  factory _$_UserGoogleModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserGoogleModelFromJson(json);

  @override
  final String idUser;
  @override
  final String nameUser;
  @override
  final String emailUser;
  @override
  final String imageUser;
  @override
  final String tokenFcm;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'UserGoogleModel(idUser: $idUser, nameUser: $nameUser, emailUser: $emailUser, imageUser: $imageUser, tokenFcm: $tokenFcm, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserGoogleModel &&
            (identical(other.idUser, idUser) ||
                const DeepCollectionEquality().equals(other.idUser, idUser)) &&
            (identical(other.nameUser, nameUser) ||
                const DeepCollectionEquality()
                    .equals(other.nameUser, nameUser)) &&
            (identical(other.emailUser, emailUser) ||
                const DeepCollectionEquality()
                    .equals(other.emailUser, emailUser)) &&
            (identical(other.imageUser, imageUser) ||
                const DeepCollectionEquality()
                    .equals(other.imageUser, imageUser)) &&
            (identical(other.tokenFcm, tokenFcm) ||
                const DeepCollectionEquality()
                    .equals(other.tokenFcm, tokenFcm)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idUser) ^
      const DeepCollectionEquality().hash(nameUser) ^
      const DeepCollectionEquality().hash(emailUser) ^
      const DeepCollectionEquality().hash(imageUser) ^
      const DeepCollectionEquality().hash(tokenFcm) ^
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$UserGoogleModelCopyWith<_UserGoogleModel> get copyWith =>
      __$UserGoogleModelCopyWithImpl<_UserGoogleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserGoogleModelToJson(this);
  }
}

abstract class _UserGoogleModel implements UserGoogleModel {
  const factory _UserGoogleModel(
      {String idUser,
      String nameUser,
      String emailUser,
      String imageUser,
      String tokenFcm,
      DateTime createdDate}) = _$_UserGoogleModel;

  factory _UserGoogleModel.fromJson(Map<String, dynamic> json) =
      _$_UserGoogleModel.fromJson;

  @override
  String get idUser;
  @override
  String get nameUser;
  @override
  String get emailUser;
  @override
  String get imageUser;
  @override
  String get tokenFcm;
  @override
  DateTime get createdDate;
  @override
  _$UserGoogleModelCopyWith<_UserGoogleModel> get copyWith;
}
