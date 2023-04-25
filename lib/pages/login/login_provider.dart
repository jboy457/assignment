import 'package:assignment/constants/app_api.dart';
import 'package:assignment/library/api_request.dart';

class LoginProvider {
  void loginUser(
    Map<String, dynamic> data, {
    Function()? beforeSend,
    required Function(Map<String, dynamic> loginData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    print('got here');
    ApiRequest(url: AppApi.login, data: data).post(
      null,
      onSuccess: (data) {
        print(data);
        onSuccess(data);
      },
      onError: (err) => onError(err),
    );
  }
}
