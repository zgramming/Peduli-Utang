import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_statenotifier_model.freezed.dart';

@freezed
abstract class GlobalStateNotifierModel with _$GlobalStateNotifierModel {
  const factory GlobalStateNotifierModel({
    bool isLoading,
    bool isImageLoading,
    bool isObsecurePassword,
    int indexBottomNavigation,
    bool alreadyLogin,
    bool alreadyOnboarding,
    bool isDarkMode,
  }) = _GlobalStateNotifierModel;
}
// class GlobalStateNotifierModel {
//   bool isLoading;
//   bool isImageLoading;
//   bool isObsecurePassword;
//   int indexBottomNavigation;
//   bool alreadyLogin;
//   bool alreadyOnboarding;
//   bool isDarkMode;
//   GlobalStateNotifierModel({
//     this.isImageLoading,
//     this.isLoading,
//     this.isObsecurePassword,
//     this.indexBottomNavigation,
//     this.alreadyLogin,
//     this.alreadyOnboarding,
//     this.isDarkMode,
//   });
// }
