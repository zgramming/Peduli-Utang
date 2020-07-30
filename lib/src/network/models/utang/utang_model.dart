import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'utang_model.freezed.dart';
part 'utang_model.g.dart';

@freezed
abstract class UtangModel with _$UtangModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UtangModel({
    String idUtang,
    UserGoogleModel pembertang,
    UserGoogleModel pengutang,
    int totalUtang,
    int sisaUtang,
    DateTime tglKembali,
    String status,
    String keterangan,
    String selfie,
    String ttd,
    DateTime createdDate,
  }) = _UtangModel;
  factory UtangModel.fromJson(Map<String, dynamic> json) => _$UtangModelFromJson(json);
}

// import '../models.dart';

// class UtangModel {
//   UtangModel({
//     this.idUtang,
//     this.pembertang,
//     this.pengutang,
//     this.totalUtang,
//     this.sisaUtang,
//     this.tglKembali,
//     this.status,
//     this.keterangan,
//     this.selfie,
//     this.ttd,
//     this.createdDate,
//   });

//   String idUtang;
//   UserGoogleModel pembertang;
//   UserGoogleModel pengutang;
//   int totalUtang;
//   int sisaUtang;
//   DateTime tglKembali;
//   String status;
//   String keterangan;
//   String selfie;
//   String ttd;
//   DateTime createdDate;

//   factory UtangModel.fromJson(Map<String, dynamic> json) => UtangModel(
//         idUtang: json['id_utang'],
//         pembertang: UserGoogleModel.fromJson(json['pembertang']),
//         pengutang: UserGoogleModel.fromJson(json['pengutang']),
//         totalUtang: int.tryParse(json['total_utang']),
//         sisaUtang: int.tryParse(json['sisa_utang']),
//         tglKembali: DateTime.parse(json['tgl_kembali']),
//         status: json['status'],
//         keterangan: json['keterangan'],
//         selfie: json['selfie'],
//         ttd: json['ttd'],
//         createdDate: DateTime.parse(json['created_date']),
//       );

//   Map<String, dynamic> toJson() => {
//         'id_utang': idUtang,
//         'pembertang': pembertang.toJson(),
//         'pengutang': pengutang.toJson(),
//         'total_utang': totalUtang.toString(),
//         'sisa_utang': sisaUtang.toString(),
//         'tgl_kembali': tglKembali.toIso8601String(),
//         'status': status,
//         'keterangan': keterangan,
//         'selfie': selfie,
//         'ttd': ttd,
//         'created_date': createdDate.toIso8601String(),
//       };
// }
