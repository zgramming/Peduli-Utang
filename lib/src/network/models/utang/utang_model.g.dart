// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UtangModel _$_$_UtangModelFromJson(Map<String, dynamic> json) {
  return _$_UtangModel(
    idUtang: json['id_utang'] as String,
    pembertang: json['pembertang'] == null
        ? null
        : UserGoogleModel.fromJson(json['pembertang'] as Map<String, dynamic>),
    pengutang: json['pengutang'] == null
        ? null
        : UserGoogleModel.fromJson(json['pengutang'] as Map<String, dynamic>),
    totalUtang: UtangModel._stringToInt(json['total_utang'] as String),
    sisaUtang: UtangModel._stringToInt(json['sisa_utang'] as String),
    tglKembali: json['tgl_kembali'] == null
        ? null
        : DateTime.parse(json['tgl_kembali'] as String),
    status: json['status'] as String,
    keterangan: json['keterangan'] as String,
    selfie: json['selfie'] as String,
    ttd: json['ttd'] as String,
    createdDate: json['created_date'] == null
        ? null
        : DateTime.parse(json['created_date'] as String),
  );
}

Map<String, dynamic> _$_$_UtangModelToJson(_$_UtangModel instance) =>
    <String, dynamic>{
      'id_utang': instance.idUtang,
      'pembertang': instance.pembertang,
      'pengutang': instance.pengutang,
      'total_utang': UtangModel._stringFromInt(instance.totalUtang),
      'sisa_utang': UtangModel._stringFromInt(instance.sisaUtang),
      'tgl_kembali': instance.tglKembali?.toIso8601String(),
      'status': instance.status,
      'keterangan': instance.keterangan,
      'selfie': instance.selfie,
      'ttd': instance.ttd,
      'created_date': instance.createdDate?.toIso8601String(),
    };
