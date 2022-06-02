class HotRightNowDetailModel {
  int? status;
  String? message;
  String? itemBaseUrl;
  Data? data;

  HotRightNowDetailModel(
      {this.status, this.message, this.itemBaseUrl, this.data});

  HotRightNowDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? bundleNameAr;
  String? bundleName;
  String? description;
  String? descriptionAr;
  int? subCategoryId;
  String? items;
  String? price;
  String? totalAfterDiscount;
  int? stock;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? img;
  int? addedInCart;
  StoreDetails? storeDetails;

  Data(
      {this.id,
        this.bundleNameAr,
        this.bundleName,
        this.description,
        this.descriptionAr,
        this.subCategoryId,
        this.items,
        this.price,
        this.totalAfterDiscount,
        this.stock,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.img,
        this.addedInCart,
        this.storeDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bundleNameAr = json['bundle_name_ar'];
    bundleName = json['bundle_name'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    subCategoryId = json['sub_category_id'];
    items = json['items'];
    price = json['price'];
    totalAfterDiscount = json['total_after_discount'];
    stock = json['stock'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    img = json['img'];
    addedInCart = json['added_in_cart'];
    storeDetails = json['store_details'] != null
        ? new StoreDetails.fromJson(json['store_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bundle_name_ar'] = this.bundleNameAr;
    data['bundle_name'] = this.bundleName;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['sub_category_id'] = this.subCategoryId;
    data['items'] = this.items;
    data['price'] = this.price;
    data['total_after_discount'] = this.totalAfterDiscount;
    data['stock'] = this.stock;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['img'] = this.img;
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
  String? status;
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
