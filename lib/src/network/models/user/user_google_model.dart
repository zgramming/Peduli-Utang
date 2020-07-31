import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_google_model.freezed.dart';
part 'user_google_model.g.dart';

@freezed
abstract class UserGoogleModel with _$UserGoogleModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserGoogleModel({
    String idUser,
    String nameUser,
    String emailUser,
    String imageUser,
    String tokenFcm,
    String allowUtang,
    DateTime createdDate,
  }) = _UserGoogleModel;
  factory UserGoogleModel.fromJson(Map<String, dynamic> json) => _$UserGoogleModelFromJson(json);
}

// class UserGoogleModel {
//   UserGoogleModel({
//     this.idUser,
//     this.nameUser,
//     this.emailUser,
//     this.imageUser,
//     this.tokenFcm,
//     this.createdDate,
//   });

//   String idUser;
//   String nameUser;
//   String emailUser;
//   String imageUser;
//   String tokenFcm;
//   DateTime createdDate;

//   factory UserGoogleModel.fromJson(Map<String, dynamic> json) => UserGoogleModel(
//         idUser: json['id_user'],
//         nameUser: json['name_user'],
//         emailUser: json['email_user'],
//         imageUser: json['image_user'],
//         tokenFcm: json['token_fcm'],
//         createdDate: DateTime.parse(json['created_date']),
//       );

//   Map<String, dynamic> toJson() => {
//         'id_user': idUser,
//         'name_user': nameUser,
//         'email_user': emailUser,
//         'image_user': imageUser,
//         'token_fcm': tokenFcm,
//         'created_date': createdDate.toIso8601String(),
//       };
// }
