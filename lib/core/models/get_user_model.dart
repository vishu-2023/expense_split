// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);
class GetUserModel {
  String? message;
  String? homePage;
  String? fullName;
  Data? data;

  GetUserModel({
    this.message,
    this.homePage,
    this.fullName,
    this.data,
  });
  factory GetUserModel.fromMap(Map<String, dynamic> map) => GetUserModel(
        message: map["message"],
        homePage: map["home_page"],
        fullName: map["full_name"],
        data: map["data"] != null ? Data.fromMap(map["data"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "home_page": homePage,
        "full_name": fullName,
        "data": data?.toMap(),
      };
  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        message: json["message"],
        homePage: json["home_page"],
        fullName: json["full_name"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "home_page": homePage,
        "full_name": fullName,
        "data": data?.toJson(),
      };
}

class Data {
  String? user;
  String? apiKey;
  String? apiSecret;
  int? createAccount;
  Data({
    this.user,
    this.apiKey,
    this.apiSecret,
    this.createAccount,
  });
  factory Data.fromMap(Map<String, dynamic> map) => Data(
        user: map["user"],
        apiKey: map["api_key"],
        apiSecret: map["api_secret"],
        createAccount: map["create_account"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "api_key": apiKey,
        "api_secret": apiSecret,
        "create_account": createAccount,
      };
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"],
        apiKey: json["api_key"],
        apiSecret: json["api_secret"],
        createAccount: json["create_account"],
      );

  Map<String, dynamic> toJson() =>
      {"user": user, "api_key": apiKey, "api_secret": apiSecret, "create_account": createAccount};
}
