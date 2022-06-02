class CategoryListModel {
  int? status;
  String? message;
  String? itemBaseUrl;
  String? categoryBaseUrl;
  List<CategoryData>? data;

  CategoryListModel(
      {this.status,
        this.message,
        this.itemBaseUrl,
        this.categoryBaseUrl,
        this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    itemBaseUrl = json['item_base_url'];
    categoryBaseUrl = json['category_base_url'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['item_base_url'] = this.itemBaseUrl;
    data['category_base_url'] = this.categoryBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
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
  Null? updatedAt;
  int? addedInCart;

  CategoryData(
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
        this.updatedAt,this.addedInCart});

  CategoryData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
