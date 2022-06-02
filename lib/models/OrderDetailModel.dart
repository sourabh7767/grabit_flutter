class OrderDetailModel {
  int? status;
  String? message;
  String? itemBaseUrl;
  String? bundelBaseUrl;
  String? storeBaseUrl;
  Data? data;

  OrderDetailModel(
      {this.status,
        this.message,
        this.itemBaseUrl,
        this.bundelBaseUrl,
        this.storeBaseUrl,
        this.data});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    itemBaseUrl = json['item_base_url'];
    bundelBaseUrl = json['bundel_base_url'];
    storeBaseUrl = json['store_base_url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['item_base_url'] = this.itemBaseUrl;
    data['bundel_base_url'] = this.bundelBaseUrl;
    data['store_base_url'] = this.storeBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? orderNumber;
  int? userId;
  int? storeId;
  List<Items>? items;
  String? totalPrice;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? deliveryType;
  String? dundle;
  String? address;
  String? latitude;
  String? logitude;

  Data(
      {this.id,
        this.orderNumber,
        this.userId,
        this.storeId,
        this.items,
        this.totalPrice,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.deliveryType,
        this.dundle,
        this.address,
        this.latitude,
        this.logitude});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    userId = json['user_id'];
    storeId = json['store_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    deliveryType = json['delivery_type'];
    dundle = json['dundle'];
    address = json['address'];
    latitude = json['latitude'];
    logitude = json['logitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['delivery_type'] = this.deliveryType;
    data['dundle'] = this.dundle;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['logitude'] = this.logitude;
    return data;
  }
}

class Items {
  int? id;
  int? cartId;
  int? userId;
  int? itemType;
  int? itemId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? price;
  ItemDetails? itemDetails;

  Items(
      {this.id,
        this.cartId,
        this.userId,
        this.itemType,
        this.itemId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.itemDetails});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    userId = json['user_id'];
    itemType = json['item_type'];
    itemId = json['item_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    itemDetails = json['item_details'] != null
        ? new ItemDetails.fromJson(json['item_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['user_id'] = this.userId;
    data['item_type'] = this.itemType;
    data['item_id'] = this.itemId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    if (this.itemDetails != null) {
      data['item_details'] = this.itemDetails!.toJson();
    }
    return data;
  }
}

class ItemDetails {
  int? id;
  String? bundleNameAr;
  String? bundleName;
  Null? description;
  Null? descriptionAr;
  int? subCategoryId;
  String? items;
  String? price;
  String? totalAfterDiscount;
  int? stock;
  int? storeId;
  String? createdAt;
  Null? updatedAt;
  int? status;
  String? img;
  StoreDetails? storeDetails;
  String? arItemName;
  String? enItemName;
  String? arDescription;
  String? enDescription;
  String? discount;
  Null? priceTimeOut;

  ItemDetails(
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
        this.storeDetails,
        this.arItemName,
        this.enItemName,
        this.arDescription,
        this.enDescription,
        this.discount,
        this.priceTimeOut});

  ItemDetails.fromJson(Map<String, dynamic> json) {
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
    storeDetails = json['store_details'] != null
        ? new StoreDetails.fromJson(json['store_details'])
        : null;
    arItemName = json['ar_item_name'];
    enItemName = json['en_item_name'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    discount = json['discount'];
    priceTimeOut = json['price_time_out'];
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
    if (this.storeDetails != null) {
      data['store_details'] = this.storeDetails!.toJson();
    }
    data['ar_item_name'] = this.arItemName;
    data['en_item_name'] = this.enItemName;
    data['ar_description'] = this.arDescription;
    data['en_description'] = this.enDescription;
    data['discount'] = this.discount;
    data['price_time_out'] = this.priceTimeOut;
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
