import 'package:split_expense/core/models/response_model.dart';
import 'package:split_expense/core/services/base_services.dart';

class AuthProviders with BaseService {
  Future<GetResponseModel> sendOtp({required String phoneNumber}) async {
    return await tryOrCatch<GetResponseModel>(() async {
      final response = await dio.post(
        "splitwise.mobile.$apiVersion.send_otp",
        data: {"mobile_no": phoneNumber},
      );
      return GetResponseModel.fromResponse(response.data["otp"]);
    });
  }

  Future<GetResponseModel> verifyOtp({required String phoneNumber, required String otp}) async {
    return await tryOrCatch<GetResponseModel>(() async {
      final response = await dio.post(
        "splitwise.mobile.$apiVersion.verify_otp",
        data: {"mobile_no": phoneNumber, "otp": otp},
      );
      return GetResponseModel.fromResponse(response);
    });
  }
}
