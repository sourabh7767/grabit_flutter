class AllStoreModel {
  int? status;
  String? message;
  String? storeBaseUrl;
  List<StoreData>? data;

  AllStoreModel({this.status, this.message, this.storeBaseUrl, this.data});

  AllStoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    storeBaseUrl = json['store_base_url'];
    if (json['data'] != null) {
      data = <StoreData>[];
      json['data'].forEach((v) {
        data!.add(new StoreData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['store_base_url'] = this.storeBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreData {
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

  StoreData(
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

  StoreData.fromJson(Map<String, dynamic> json) {
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
