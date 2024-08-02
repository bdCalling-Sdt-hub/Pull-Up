class AppUrl {
  ///<<<=================Base Url=========================>>>

  // static const baseUrl = "https://api.pullupapp.net/api";
  // static const imageUrl = "https://api.pullupapp.net";
  // static const socketUrl = "https://api.pullupapp.net";

 /* static const baseUrl = "http://143.110.241.244:3000/api";
  static const imageUrl = "http://143.110.241.244:3000";
  static const socketUrl = "http://143.110.241.244:3000";*/

   static const baseUrl = "http://103.145.138.74:3002/api";
  static const imageUrl = "http://103.145.138.74:3002";
  static const socketUrl = "http://103.145.138.74:3002";

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
  static const paymentWithProduct =
      "$baseUrl/payment/connect-create-payment-intent";
  static const paymentWithEvent =
      "$baseUrl/payment/connect-create-payment-intent-event";
  static const crateEvent = "$baseUrl/event/create-event";
  static const event = "$baseUrl/event";
  static const eventList = "$baseUrl/event/event-join";
  static const isFavorite = "$baseUrl/favorite/add";
  static const favorite = "$baseUrl/favorite";
  static const profile = "$baseUrl/users/profile";
  static const user = "$baseUrl/users";
  static const income = "$baseUrl/payment/current-balance";
  static const nearbyShop = "$baseUrl/product/near-product";
  static const shopProduct = "$baseUrl/product/single-shop-by-product";
  static const history = "$baseUrl/product/product-history";
  static const myProductHistory = "$baseUrl/product/receiver-product-history";
  static const notifications = "$baseUrl/notifications/user-notification";
  static const myEvent = "$baseUrl/event/user-wise-event";
  static const myEventHistory = "$baseUrl/event/receiver-event-history";
  static const eventHistory = "$baseUrl/event/event-history";
  static const deActiveUser = "$baseUrl/users/deactive-users";
}
