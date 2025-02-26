import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_expense/core/services/helpers.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class GetUserModel with _$GetUserModel {
  const factory GetUserModel({
    String? message,
    String? homePage,
    String? fullName,
    Data? data,
  }) = _GetUserModel;

  factory GetUserModel.fromJson(Map<String, dynamic> json) => _$GetUserModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? user,
    String? apiKey,
    String? apiSecret,
    @FlagConverter() bool? createAccount,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
