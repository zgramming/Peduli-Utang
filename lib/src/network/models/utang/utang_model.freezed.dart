// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'utang_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UtangModel _$UtangModelFromJson(Map<String, dynamic> json) {
  return _UtangModel.fromJson(json);
}

class _$UtangModelTearOff {
  const _$UtangModelTearOff();

// ignore: unused_element
  _UtangModel call(
      {String idUtang,
      UserGoogleModel pembertang,
      UserGoogleModel pengutang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'totalUtang')
          int totalUtang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'sisaUtang')
          int sisaUtang,
      DateTime tglKembali,
      String status,
      String keterangan,
      String selfie,
      String ttd,
      DateTime createdDate}) {
    return _UtangModel(
      idUtang: idUtang,
      pembertang: pembertang,
      pengutang: pengutang,
      totalUtang: totalUtang,
      sisaUtang: sisaUtang,
      tglKembali: tglKembali,
      status: status,
      keterangan: keterangan,
      selfie: selfie,
      ttd: ttd,
      createdDate: createdDate,
    );
  }
}

// ignore: unused_element
const $UtangModel = _$UtangModelTearOff();

mixin _$UtangModel {
  String get idUtang;
  UserGoogleModel get pembertang;
  UserGoogleModel get pengutang;
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'totalUtang')
  int get totalUtang;
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'sisaUtang')
  int get sisaUtang;
  DateTime get tglKembali;
  String get status;
  String get keterangan;
  String get selfie;
  String get ttd;
  DateTime get createdDate;

  Map<String, dynamic> toJson();
  $UtangModelCopyWith<UtangModel> get copyWith;
}

abstract class $UtangModelCopyWith<$Res> {
  factory $UtangModelCopyWith(
          UtangModel value, $Res Function(UtangModel) then) =
      _$UtangModelCopyWithImpl<$Res>;
  $Res call(
      {String idUtang,
      UserGoogleModel pembertang,
      UserGoogleModel pengutang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'totalUtang')
          int totalUtang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'sisaUtang')
          int sisaUtang,
      DateTime tglKembali,
      String status,
      String keterangan,
      String selfie,
      String ttd,
      DateTime createdDate});

  $UserGoogleModelCopyWith<$Res> get pembertang;
  $UserGoogleModelCopyWith<$Res> get pengutang;
}

class _$UtangModelCopyWithImpl<$Res> implements $UtangModelCopyWith<$Res> {
  _$UtangModelCopyWithImpl(this._value, this._then);

  final UtangModel _value;
  // ignore: unused_field
  final $Res Function(UtangModel) _then;

  @override
  $Res call({
    Object idUtang = freezed,
    Object pembertang = freezed,
    Object pengutang = freezed,
    Object totalUtang = freezed,
    Object sisaUtang = freezed,
    Object tglKembali = freezed,
    Object status = freezed,
    Object keterangan = freezed,
    Object selfie = freezed,
    Object ttd = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      idUtang: idUtang == freezed ? _value.idUtang : idUtang as String,
      pembertang: pembertang == freezed
          ? _value.pembertang
          : pembertang as UserGoogleModel,
      pengutang: pengutang == freezed
          ? _value.pengutang
          : pengutang as UserGoogleModel,
      totalUtang: totalUtang == freezed ? _value.totalUtang : totalUtang as int,
      sisaUtang: sisaUtang == freezed ? _value.sisaUtang : sisaUtang as int,
      tglKembali:
          tglKembali == freezed ? _value.tglKembali : tglKembali as DateTime,
      status: status == freezed ? _value.status : status as String,
      keterangan:
          keterangan == freezed ? _value.keterangan : keterangan as String,
      selfie: selfie == freezed ? _value.selfie : selfie as String,
      ttd: ttd == freezed ? _value.ttd : ttd as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }

  @override
  $UserGoogleModelCopyWith<$Res> get pembertang {
    if (_value.pembertang == null) {
      return null;
    }
    return $UserGoogleModelCopyWith<$Res>(_value.pembertang, (value) {
      return _then(_value.copyWith(pembertang: value));
    });
  }

  @override
  $UserGoogleModelCopyWith<$Res> get pengutang {
    if (_value.pengutang == null) {
      return null;
    }
    return $UserGoogleModelCopyWith<$Res>(_value.pengutang, (value) {
      return _then(_value.copyWith(pengutang: value));
    });
  }
}

abstract class _$UtangModelCopyWith<$Res> implements $UtangModelCopyWith<$Res> {
  factory _$UtangModelCopyWith(
          _UtangModel value, $Res Function(_UtangModel) then) =
      __$UtangModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idUtang,
      UserGoogleModel pembertang,
      UserGoogleModel pengutang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'totalUtang')
          int totalUtang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'sisaUtang')
          int sisaUtang,
      DateTime tglKembali,
      String status,
      String keterangan,
      String selfie,
      String ttd,
      DateTime createdDate});

  @override
  $UserGoogleModelCopyWith<$Res> get pembertang;
  @override
  $UserGoogleModelCopyWith<$Res> get pengutang;
}

class __$UtangModelCopyWithImpl<$Res> extends _$UtangModelCopyWithImpl<$Res>
    implements _$UtangModelCopyWith<$Res> {
  __$UtangModelCopyWithImpl(
      _UtangModel _value, $Res Function(_UtangModel) _then)
      : super(_value, (v) => _then(v as _UtangModel));

  @override
  _UtangModel get _value => super._value as _UtangModel;

  @override
  $Res call({
    Object idUtang = freezed,
    Object pembertang = freezed,
    Object pengutang = freezed,
    Object totalUtang = freezed,
    Object sisaUtang = freezed,
    Object tglKembali = freezed,
    Object status = freezed,
    Object keterangan = freezed,
    Object selfie = freezed,
    Object ttd = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_UtangModel(
      idUtang: idUtang == freezed ? _value.idUtang : idUtang as String,
      pembertang: pembertang == freezed
          ? _value.pembertang
          : pembertang as UserGoogleModel,
      pengutang: pengutang == freezed
          ? _value.pengutang
          : pengutang as UserGoogleModel,
      totalUtang: totalUtang == freezed ? _value.totalUtang : totalUtang as int,
      sisaUtang: sisaUtang == freezed ? _value.sisaUtang : sisaUtang as int,
      tglKembali:
          tglKembali == freezed ? _value.tglKembali : tglKembali as DateTime,
      status: status == freezed ? _value.status : status as String,
      keterangan:
          keterangan == freezed ? _value.keterangan : keterangan as String,
      selfie: selfie == freezed ? _value.selfie : selfie as String,
      ttd: ttd == freezed ? _value.ttd : ttd as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_UtangModel implements _UtangModel {
  const _$_UtangModel(
      {this.idUtang,
      this.pembertang,
      this.pengutang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'totalUtang')
          this.totalUtang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'sisaUtang')
          this.sisaUtang,
      this.tglKembali,
      this.status,
      this.keterangan,
      this.selfie,
      this.ttd,
      this.createdDate});

  factory _$_UtangModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UtangModelFromJson(json);

  @override
  final String idUtang;
  @override
  final UserGoogleModel pembertang;
  @override
  final UserGoogleModel pengutang;
  @override
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'totalUtang')
  final int totalUtang;
  @override
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'sisaUtang')
  final int sisaUtang;
  @override
  final DateTime tglKembali;
  @override
  final String status;
  @override
  final String keterangan;
  @override
  final String selfie;
  @override
  final String ttd;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'UtangModel(idUtang: $idUtang, pembertang: $pembertang, pengutang: $pengutang, totalUtang: $totalUtang, sisaUtang: $sisaUtang, tglKembali: $tglKembali, status: $status, keterangan: $keterangan, selfie: $selfie, ttd: $ttd, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UtangModel &&
            (identical(other.idUtang, idUtang) ||
                const DeepCollectionEquality()
                    .equals(other.idUtang, idUtang)) &&
            (identical(other.pembertang, pembertang) ||
                const DeepCollectionEquality()
                    .equals(other.pembertang, pembertang)) &&
            (identical(other.pengutang, pengutang) ||
                const DeepCollectionEquality()
                    .equals(other.pengutang, pengutang)) &&
            (identical(other.totalUtang, totalUtang) ||
                const DeepCollectionEquality()
                    .equals(other.totalUtang, totalUtang)) &&
            (identical(other.sisaUtang, sisaUtang) ||
                const DeepCollectionEquality()
                    .equals(other.sisaUtang, sisaUtang)) &&
            (identical(other.tglKembali, tglKembali) ||
                const DeepCollectionEquality()
                    .equals(other.tglKembali, tglKembali)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.keterangan, keterangan) ||
                const DeepCollectionEquality()
                    .equals(other.keterangan, keterangan)) &&
            (identical(other.selfie, selfie) ||
                const DeepCollectionEquality().equals(other.selfie, selfie)) &&
            (identical(other.ttd, ttd) ||
                const DeepCollectionEquality().equals(other.ttd, ttd)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idUtang) ^
      const DeepCollectionEquality().hash(pembertang) ^
      const DeepCollectionEquality().hash(pengutang) ^
      const DeepCollectionEquality().hash(totalUtang) ^
      const DeepCollectionEquality().hash(sisaUtang) ^
      const DeepCollectionEquality().hash(tglKembali) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(keterangan) ^
      const DeepCollectionEquality().hash(selfie) ^
      const DeepCollectionEquality().hash(ttd) ^
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$UtangModelCopyWith<_UtangModel> get copyWith =>
      __$UtangModelCopyWithImpl<_UtangModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UtangModelToJson(this);
  }
}

abstract class _UtangModel implements UtangModel {
  const factory _UtangModel(
      {String idUtang,
      UserGoogleModel pembertang,
      UserGoogleModel pengutang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'totalUtang')
          int totalUtang,
      @JsonKey(fromJson: UtangModel._stringToInt, toJson: UtangModel._stringFromInt, name: 'sisaUtang')
          int sisaUtang,
      DateTime tglKembali,
      String status,
      String keterangan,
      String selfie,
      String ttd,
      DateTime createdDate}) = _$_UtangModel;

  factory _UtangModel.fromJson(Map<String, dynamic> json) =
      _$_UtangModel.fromJson;

  @override
  String get idUtang;
  @override
  UserGoogleModel get pembertang;
  @override
  UserGoogleModel get pengutang;
  @override
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'totalUtang')
  int get totalUtang;
  @override
  @JsonKey(
      fromJson: UtangModel._stringToInt,
      toJson: UtangModel._stringFromInt,
      name: 'sisaUtang')
  int get sisaUtang;
  @override
  DateTime get tglKembali;
  @override
  String get status;
  @override
  String get keterangan;
  @override
  String get selfie;
  @override
  String get ttd;
  @override
  DateTime get createdDate;
  @override
  _$UtangModelCopyWith<_UtangModel> get copyWith;
}
