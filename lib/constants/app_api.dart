class AppApi {
  // static const String _liveBaseURL = "https://staging.api.a1tutor.org/v1";
  static const String _localBaseURL = "http://10.0.2.2:8000";

  static const String _baseURL = _localBaseURL;

  // Authentication
  static const String login = "$_baseURL/user/login";
  static const String register = "$_baseURL/user/register";
}
