// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_google_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserGoogleModel _$_$_UserGoogleModelFromJson(Map<String, dynamic> json) {
  return _$_UserGoogleModel(
    idUser: json['id_user'] as String,
    nameUser: json['name_user'] as String,
    emailUser: json['email_user'] as String,
    imageUser: json['image_user'] as String,
    tokenFcm: json['token_fcm'] as String,
    allowUtang: json['allow_utang'] as String,
    createdDate: json['created_date'] == null
        ? null
        : DateTime.parse(json['created_date'] as String),
  );
}

Map<String, dynamic> _$_$_UserGoogleModelToJson(_$_UserGoogleModel instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'name_user': instance.nameUser,
      'email_user': instance.emailUser,
      'image_user': instance.imageUser,
      'token_fcm': instance.tokenFcm,
      'allow_utang': instance.allowUtang,
      'created_date': instance.createdDate?.toIso8601String(),
    };
