import 'package:assignment/constants/app_api.dart';
import 'package:assignment/library/api_request.dart';

class RegisterProvider {
  void registerUser(
    Map<String, dynamic> data, {
    Function()? beforeSend,
    required Function(Map<String, dynamic> loginData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    ApiRequest(url: AppApi.register, data: data).post(
      null,
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (err) => onError(err),
    );
  }
}
