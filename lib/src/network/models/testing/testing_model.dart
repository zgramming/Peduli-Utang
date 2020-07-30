import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'testing_model.freezed.dart';
part 'testing_model.g.dart';

@freezed
abstract class TestingModel with _$TestingModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestingModel({
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
  }) = _TestingModel;
  factory TestingModel.fromJson(Map<String, dynamic> json) => _$TestingModelFromJson(json);
}
