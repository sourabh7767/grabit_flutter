final urls = Urls();

class Urls {
  final baseUrl = "https://grab-it.net/public";

  String get register => "$baseUrl/api/register";
  String get login => "$baseUrl/api/login";
  String get updateProfile => "$baseUrl/api/update_profile";
  String get changePassword => "$baseUrl/api/change_password";
  String get logout => "$baseUrl/api/logout";
  String get verifyOtp => "$baseUrl/api/verify-otp";
  String get firebaseTokenUpdate => "$baseUrl/api/update_token";
  String get home => "$baseUrl/api/home";
  String get getAllStores => "$baseUrl/api/get_all_stores";
  String get getStoreDetail => "$baseUrl/api/get_store/";
  String get getNotifications => "$baseUrl/api/get_notifications";
  String get getCategoryById => "$baseUrl/api/get_items_category/";
  String get getItemById => "$baseUrl/api/get_item_details/";
  String get getHotRightById => "$baseUrl/api/get_bundel_details/";

// Cart API's
  String get addToCart => "$baseUrl/api/cart/add";
  String get getCartData => "$baseUrl/api/cart";
  String get removeCart => "$baseUrl/api/cart/remove";
  String get addItemQuantity => "$baseUrl/api/add/item/quantity";

// Order API's
  String get placeOrder => "$baseUrl/api/order/add";
  String get getOrder => "$baseUrl/api/orders";
  String get getOrderById => "$baseUrl/api/orders/";

  String get imageBaseUrl => "$baseUrl/images/categories/";
  String get storeImageUrl => "$baseUrl/images/stores/";
  String get notiImageUrl => "$baseUrl/images/item/";
  String get itemsUrl => "$baseUrl/images/items/";
}
