class AppUrl {
  ///<<<=================Base Url=========================>>>
  static const baseUrl = "http://192.168.10.14:3000/api";

  // static const baseUrl = "http://103.145.138.78:3000";
  // static const baseUrl = "https://api.dialogi.net";

  static const signUp = "$baseUrl/users/create-user";
  static const verifyEmail = "$baseUrl/users/verify-email";
  static const signIn = "$baseUrl/users/sign-in";
  static const forgotPassword = "$baseUrl/users/forgot-password";
  static const forgotPasswordVerify = "$baseUrl/users/fp-verify-code";
}
