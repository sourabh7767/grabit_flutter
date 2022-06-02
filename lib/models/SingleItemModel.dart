class SingleItemModel {
  int? status;
  String? message;
  String? itemBaseUrl;
  Data? data;

  SingleItemModel({this.status, this.message, this.itemBaseUrl, this.data});

  SingleItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    itemBaseUrl = json['item_base_url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['item_base_url'] = this.itemBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? arItemName;
  String? enItemName;
  String? arDescription;
  String? enDescription;
  int? subCategoryId;
  int? storeId;
  String? price;
  String? discount;
  int? status;
  String? img;
  int? stock;
  String? priceTimeOut;
  String? createdAt;
  String? updatedAt;
  int? addedInCart;
  StoreDetails? storeDetails;

  Data(
      {this.id,
        this.arItemName,
        this.enItemName,
        this.arDescription,
        this.enDescription,
        this.subCategoryId,
        this.storeId,
        this.price,
        this.discount,
        this.status,
        this.img,
        this.stock,
        this.priceTimeOut,
        this.createdAt,
        this.updatedAt,
        this.addedInCart,
        this.storeDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arItemName = json['ar_item_name'];
    enItemName = json['en_item_name'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    subCategoryId = json['sub_category_id'];
    storeId = json['store_id'];
    price = json['price'];
    discount = json['discount'];
    status = json['status'];
    img = json['img'];
    stock = json['stock'];
    priceTimeOut = json['price_time_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedInCart = json['added_in_cart'];
    storeDetails = json['store_details'] != null
        ? new StoreDetails.fromJson(json['store_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_item_name'] = this.arItemName;
    data['en_item_name'] = this.enItemName;
    data['ar_description'] = this.arDescription;
    data['en_description'] = this.enDescription;
    data['sub_category_id'] = this.subCategoryId;
    data['store_id'] = this.storeId;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['status'] = this.status;
    data['img'] = this.img;
    data['stock'] = this.stock;
    data['price_time_out'] = this.priceTimeOut;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['added_in_cart'] = this.addedInCart;
    if (this.storeDetails != null) {
      data['store_details'] = this.storeDetails!.toJson();
    }
    return data;
  }
}

class StoreDetails {
  int? id;
  String? arName;
  String? enName;
  int? categoryId;
  String? logo;
  String? location;
  int? region;
  int? city;
  String? longitude;
  String? latitude;
  String? phone;
  Null? status;
  String? deliveryPrice;

  StoreDetails(
      {this.id,
        this.arName,
        this.enName,
        this.categoryId,
        this.logo,
        this.location,
        this.region,
        this.city,
        this.longitude,
        this.latitude,
        this.phone,
        this.status,
        this.deliveryPrice});

  StoreDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    categoryId = json['category_id'];
    logo = json['logo'];
    location = json['location'];
    region = json['region'];
    city = json['city'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    phone = json['phone'];
    status = json['status'];
    deliveryPrice = json['delivery_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    data['category_id'] = this.categoryId;
    data['logo'] = this.logo;
    data['location'] = this.location;
    data['region'] = this.region;
    data['city'] = this.city;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['delivery_price'] = this.deliveryPrice;
    return data;
  }
}
