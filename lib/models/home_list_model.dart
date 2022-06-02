class HomeListModel {
  int? status;
  String? message;
  String? storeBaseUrl;
  String? itemBaseUrl;
  Data? data;

  HomeListModel(
      {this.status,
        this.message,
        this.storeBaseUrl,
        this.itemBaseUrl,
        this.data});

  HomeListModel.fromJson(Map<String, dynamic> json) {
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
  List<NearByStore>? nearByStore;
  List<CategoryList>? categoryList;
  List<HotDeal>? hotDeal;
  List<NearByMe>? nearByMe;

  Data({this.nearByStore, this.categoryList, this.hotDeal, this.nearByMe});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['near_by_store'] != null) {
      nearByStore = <NearByStore>[];
      json['near_by_store'].forEach((v) {
        nearByStore!.add(new NearByStore.fromJson(v));
      });
    }
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    if (json['hot_deal'] != null) {
      hotDeal = <HotDeal>[];
      json['hot_deal'].forEach((v) {
        hotDeal!.add(new HotDeal.fromJson(v));
      });
    }
    if (json['near_by_me'] != null) {
      nearByMe = <NearByMe>[];
      json['near_by_me'].forEach((v) {
        nearByMe!.add(new NearByMe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nearByStore != null) {
      data['near_by_store'] = this.nearByStore!.map((v) => v.toJson()).toList();
    }
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    if (this.hotDeal != null) {
      data['hot_deal'] = this.hotDeal!.map((v) => v.toJson()).toList();
    }
    if (this.nearByMe != null) {
      data['near_by_me'] = this.nearByMe!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearByStore {
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

  NearByStore(
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

  NearByStore.fromJson(Map<String, dynamic> json) {
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

class CategoryList {
  int? id;
  String? categoryName;
  String? categoryNameAr;
  String? description;
  String? descriptionAr;
  String? img;

  CategoryList(
      {this.id,
        this.categoryName,
        this.categoryNameAr,
        this.description,
        this.descriptionAr,
        this.img});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['img'] = this.img;
    return data;
  }
}

class HotDeal {
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
  NearByStore? storeDetails;

  HotDeal(
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
        this.storeDetails});

  HotDeal.fromJson(Map<String, dynamic> json) {
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
        ? new NearByStore.fromJson(json['store_details'])
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
    if (this.storeDetails != null) {
      data['store_details'] = this.storeDetails!.toJson();
    }
    return data;
  }
}

class NearByMe {
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
  NearByStore? storeDetails;

  NearByMe(
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

  NearByMe.fromJson(Map<String, dynamic> json) {
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
        ? new NearByStore.fromJson(json['store_details'])
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
