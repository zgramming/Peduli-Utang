import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class HistoryModel with _$HistoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HistoryModel({
    String idHistory,
    UserGoogleModel idUser,
    String idUtang,
    String kodeAksi,
    String namaAksi,
    DateTime createdDate,
  }) = _HistoryModel;
  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}
