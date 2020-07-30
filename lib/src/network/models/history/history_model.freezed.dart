// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

class _$HistoryModelTearOff {
  const _$HistoryModelTearOff();

// ignore: unused_element
  _HistoryModel call(
      {String idHistory,
      UserGoogleModel idUser,
      String idUtang,
      String kodeAksi,
      String namaAksi,
      DateTime createdDate}) {
    return _HistoryModel(
      idHistory: idHistory,
      idUser: idUser,
      idUtang: idUtang,
      kodeAksi: kodeAksi,
      namaAksi: namaAksi,
      createdDate: createdDate,
    );
  }
}

// ignore: unused_element
const $HistoryModel = _$HistoryModelTearOff();

mixin _$HistoryModel {
  String get idHistory;
  UserGoogleModel get idUser;
  String get idUtang;
  String get kodeAksi;
  String get namaAksi;
  DateTime get createdDate;

  Map<String, dynamic> toJson();
  $HistoryModelCopyWith<HistoryModel> get copyWith;
}

abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call(
      {String idHistory,
      UserGoogleModel idUser,
      String idUtang,
      String kodeAksi,
      String namaAksi,
      DateTime createdDate});

  $UserGoogleModelCopyWith<$Res> get idUser;
}

class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object idHistory = freezed,
    Object idUser = freezed,
    Object idUtang = freezed,
    Object kodeAksi = freezed,
    Object namaAksi = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      idHistory: idHistory == freezed ? _value.idHistory : idHistory as String,
      idUser: idUser == freezed ? _value.idUser : idUser as UserGoogleModel,
      idUtang: idUtang == freezed ? _value.idUtang : idUtang as String,
      kodeAksi: kodeAksi == freezed ? _value.kodeAksi : kodeAksi as String,
      namaAksi: namaAksi == freezed ? _value.namaAksi : namaAksi as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }

  @override
  $UserGoogleModelCopyWith<$Res> get idUser {
    if (_value.idUser == null) {
      return null;
    }
    return $UserGoogleModelCopyWith<$Res>(_value.idUser, (value) {
      return _then(_value.copyWith(idUser: value));
    });
  }
}

abstract class _$HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$HistoryModelCopyWith(
          _HistoryModel value, $Res Function(_HistoryModel) then) =
      __$HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idHistory,
      UserGoogleModel idUser,
      String idUtang,
      String kodeAksi,
      String namaAksi,
      DateTime createdDate});

  @override
  $UserGoogleModelCopyWith<$Res> get idUser;
}

class __$HistoryModelCopyWithImpl<$Res> extends _$HistoryModelCopyWithImpl<$Res>
    implements _$HistoryModelCopyWith<$Res> {
  __$HistoryModelCopyWithImpl(
      _HistoryModel _value, $Res Function(_HistoryModel) _then)
      : super(_value, (v) => _then(v as _HistoryModel));

  @override
  _HistoryModel get _value => super._value as _HistoryModel;

  @override
  $Res call({
    Object idHistory = freezed,
    Object idUser = freezed,
    Object idUtang = freezed,
    Object kodeAksi = freezed,
    Object namaAksi = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_HistoryModel(
      idHistory: idHistory == freezed ? _value.idHistory : idHistory as String,
      idUser: idUser == freezed ? _value.idUser : idUser as UserGoogleModel,
      idUtang: idUtang == freezed ? _value.idUtang : idUtang as String,
      kodeAksi: kodeAksi == freezed ? _value.kodeAksi : kodeAksi as String,
      namaAksi: namaAksi == freezed ? _value.namaAksi : namaAksi as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HistoryModel implements _HistoryModel {
  const _$_HistoryModel(
      {this.idHistory,
      this.idUser,
      this.idUtang,
      this.kodeAksi,
      this.namaAksi,
      this.createdDate});

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_HistoryModelFromJson(json);

  @override
  final String idHistory;
  @override
  final UserGoogleModel idUser;
  @override
  final String idUtang;
  @override
  final String kodeAksi;
  @override
  final String namaAksi;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'HistoryModel(idHistory: $idHistory, idUser: $idUser, idUtang: $idUtang, kodeAksi: $kodeAksi, namaAksi: $namaAksi, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HistoryModel &&
            (identical(other.idHistory, idHistory) ||
                const DeepCollectionEquality()
                    .equals(other.idHistory, idHistory)) &&
            (identical(other.idUser, idUser) ||
                const DeepCollectionEquality().equals(other.idUser, idUser)) &&
            (identical(other.idUtang, idUtang) ||
                const DeepCollectionEquality()
                    .equals(other.idUtang, idUtang)) &&
            (identical(other.kodeAksi, kodeAksi) ||
                const DeepCollectionEquality()
                    .equals(other.kodeAksi, kodeAksi)) &&
            (identical(other.namaAksi, namaAksi) ||
                const DeepCollectionEquality()
                    .equals(other.namaAksi, namaAksi)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idHistory) ^
      const DeepCollectionEquality().hash(idUser) ^
      const DeepCollectionEquality().hash(idUtang) ^
      const DeepCollectionEquality().hash(kodeAksi) ^
      const DeepCollectionEquality().hash(namaAksi) ^
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$HistoryModelCopyWith<_HistoryModel> get copyWith =>
      __$HistoryModelCopyWithImpl<_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HistoryModelToJson(this);
  }
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
      {String idHistory,
      UserGoogleModel idUser,
      String idUtang,
      String kodeAksi,
      String namaAksi,
      DateTime createdDate}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  String get idHistory;
  @override
  UserGoogleModel get idUser;
  @override
  String get idUtang;
  @override
  String get kodeAksi;
  @override
  String get namaAksi;
  @override
  DateTime get createdDate;
  @override
  _$HistoryModelCopyWith<_HistoryModel> get copyWith;
}
