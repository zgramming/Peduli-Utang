// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$_$_HistoryModelFromJson(Map<String, dynamic> json) {
  return _$_HistoryModel(
    idHistory: json['id_history'] as String,
    idUser: json['id_user'] == null
        ? null
        : UserGoogleModel.fromJson(json['id_user'] as Map<String, dynamic>),
    idUtang: json['id_utang'] as String,
    kodeAksi: json['kode_aksi'] as String,
    namaAksi: json['nama_aksi'] as String,
    createdDate: json['created_date'] == null
        ? null
        : DateTime.parse(json['created_date'] as String),
  );
}

Map<String, dynamic> _$_$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'id_history': instance.idHistory,
      'id_user': instance.idUser,
      'id_utang': instance.idUtang,
      'kode_aksi': instance.kodeAksi,
      'nama_aksi': instance.namaAksi,
      'created_date': instance.createdDate?.toIso8601String(),
    };
