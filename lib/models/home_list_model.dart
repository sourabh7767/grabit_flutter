import 'dart:convert';

class HomeListModel {
  HomeListModel({
    required this.nearByStore,
    required this.categoryList,
  });

  final List<StoreModel> nearByStore;
  final List<CategoryList> categoryList;

  factory HomeListModel.fromRawJson(String str) =>
      HomeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeListModel.fromJson(Map<String, dynamic> json) => HomeListModel(
        nearByStore: List<StoreModel>.from(
            json["near_by_store"].map((x) => StoreModel.fromJson(x))),
        categoryList: List<CategoryList>.from(
            json["category_list"].map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "near_by_store": List<dynamic>.from(nearByStore.map((x) => x.toJson())),
        "category_list":
            List<dynamic>.from(categoryList.map((x) => x.toJson())),
      };
}

class CategoryList {
  CategoryList({
    required this.id,
    required this.categoryName,
    required this.categoryNameAr,
    required this.description,
    required this.descriptionAr,
    required this.img,
  });

  final int id;
  final String categoryName;
  final String categoryNameAr;
  final String description;
  final String descriptionAr;
  final String img;

  factory CategoryList.fromRawJson(String str) =>
      CategoryList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        categoryName: json["category_name"],
        categoryNameAr: json["category_name_ar"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_name_ar": categoryNameAr,
        "description": description,
        "description_ar": descriptionAr,
        "img": img,
      };
}

class StoreModel {
  StoreModel({
    required this.id,
    required this.arName,
    required this.enName,
    required this.categoryId,
    required this.logo,
    required this.location,
    required this.region,
    required this.city,
    required this.longitude,
    required this.latitude,
    required this.phone,
    required this.status,
    required this.deliveryPrice,
  });

  final int id;
  final String arName;
  final String enName;
  final int categoryId;
  final String logo;
  final String location;
  final int region;
  final int city;
  final String longitude;
  final String latitude;
  final String phone;
  final dynamic status;
  final String deliveryPrice;

  factory StoreModel.fromRawJson(String str) =>
      StoreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        arName: json["ar_name"],
        enName: json["en_name"],
        categoryId: json["category_id"],
        logo: json["logo"],
        location: json["location"],
        region: json["region"],
        city: json["city"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        phone: json["phone"],
        status: json["status"],
        deliveryPrice: json["delivery_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ar_name": arName,
        "en_name": enName,
        "category_id": categoryId,
        "logo": logo,
        "location": location,
        "region": region,
        "city": city,
        "longitude": longitude,
        "latitude": latitude,
        "phone": phone,
        "status": status,
        "delivery_price": deliveryPrice,
      };
}
