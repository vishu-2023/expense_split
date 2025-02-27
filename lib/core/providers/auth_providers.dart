import 'package:split_expense/core/models/get_user_model.dart';
import 'package:split_expense/core/models/response_model.dart';
import 'package:split_expense/core/services/base_services.dart';
import 'package:split_expense/core/services/sf_services.dart';

class AuthProviders with BaseService {
  Future<int> sendOtp({required String phoneNumber}) async {
    return await tryOrCatch<int>(() async {
      final response = await dio.post(
        "splitwise.mobile.$apiVersion.send_otp",
        data: {"mobile_no": phoneNumber},
      );
      return response.data["data"]["otp"];
    });
  }

  Future<GetUserModel> verifyOtp({required String phoneNumber, required String otp}) async {
    return await tryOrCatch<GetUserModel>(() async {
      final response = await dio.post(
        "splitwise.mobile.$apiVersion.verify_otp",
        data: {"mobile_no": phoneNumber, "otp": otp},
      );
      final GetUserModel user = GetUserModel.fromMap(response.data);
      SFServices.setUser(user);
      return user;
    });
  }
}
