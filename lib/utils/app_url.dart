class AppUrl {
  ///<<<=================Base Url=========================>>>
  static const baseUrl = "http://192.168.10.14:3000/api";
  static const imageUrl = "http://192.168.10.14:3000";

  // static const baseUrl = "http://103.145.138.78:3000";
  // static const baseUrl = "https://api.dialogi.net";

  static const signUp = "$baseUrl/users/create-user";
  static const refreshToken = "$baseUrl/users/sign-in-with-refreh-token";
  static const verifyEmail = "$baseUrl/users/verify-email";
  static const signIn = "$baseUrl/users/sign-in";
  static const forgotPassword = "$baseUrl/users/forgot-password";
  static const forgotPasswordVerify = "$baseUrl/users/verify-code";
  static const resetPassword = "$baseUrl/users/updated-password";
  static const product = "$baseUrl/product";
  static const myProduct = "$baseUrl/product/user-wise-product";
  static const keywords = "$baseUrl/product/keywords";
  static const addProduct = "$baseUrl/product/create-product";
  static const updateAccount = "$baseUrl/users/update-account";
  static const upgradedAccount = "$baseUrl/users/upgraded-account";
  static const payment = "$baseUrl/payment/create-payment-intent";
  static const crateEvent = "$baseUrl/event/create-event";
  static const event = "$baseUrl/event";
  static const isFavorite = "$baseUrl/favorite/add";
  static const favorite = "$baseUrl/favorite";
  static const profile = "$baseUrl/users/profile";
  static const income = "$baseUrl/payment/current-balance";
}
