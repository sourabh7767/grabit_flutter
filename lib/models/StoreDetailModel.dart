class StoreDetailModel {
  int? status;
  String? message;
  String? storeBaseUrl;
  String? itemBaseUrl;
  Data? data;

  StoreDetailModel(
      {this.status,
        this.message,
        this.storeBaseUrl,
        this.itemBaseUrl,
        this.data});

  StoreDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    storeBaseUrl = json['store_base_url'];
    itemBaseUrl = json['item_base_url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['store_base_url'] = this.storeBaseUrl;
    data['item_base_url'] = this.itemBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  List<CategoryItems>? categoryItems;

  Data(
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
        this.deliveryPrice,
        this.categoryItems});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['category_items'] != null) {
      categoryItems = <CategoryItems>[];
      json['category_items'].forEach((v) {
        categoryItems!.add(new CategoryItems.fromJson(v));
      });
    }
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
    if (this.categoryItems != null) {
      data['category_items'] =
          this.categoryItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryItems {
  String? title;
  List<CategoryItemsData>? data;

  CategoryItems({this.title, this.data});

  CategoryItems.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <CategoryItemsData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryItemsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryItemsData {
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
  Null? priceTimeOut;
  String? createdAt;
  String? updatedAt;
  StoreDetails? storeDetails;

  CategoryItemsData(
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
        this.storeDetails});

  CategoryItemsData.fromJson(Map<String, dynamic> json) {
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
