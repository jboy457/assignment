import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest({required this.url, this.data});

  Dio _dio(token) {
    return Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  void get(
    token, {
    Function()? beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio(token).get(url, queryParameters: data).then(
      (res) {
        onSuccess(res.data);
      },
    ).catchError((err) {
      onError(err);
    });
  }

  void post(
    token, {
    Function()? beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    print(url);
    _dio(token).post(url, data: data).then(
      (res) {
        print(res);
        if (res.data['status'] == 'error') {
          throw res.data;
        }
        onSuccess(res.data);
      },
    ).catchError((err) {
      print(err);
      onError(err);
    });
  }
}
