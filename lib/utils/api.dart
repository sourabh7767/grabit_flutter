final urls = Urls();

class Urls {
  final baseUrl = "https://apps-valley.net/public";

  String get register => "$baseUrl/api/register";
  String get login => "$baseUrl/api/login";
  String get updateProfile => "$baseUrl/api/update_profile";
  String get changePassword => "$baseUrl/api/change_password";
  String get logout => "$baseUrl/api/logout";
  String get verifyOtp => "$baseUrl/api/verify-otp";
  String get firebaseTokenUpdate => "$baseUrl/api/update_token";
}
