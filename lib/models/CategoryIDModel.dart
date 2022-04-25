/// id : 1
/// ar_name : "tkldool"
/// en_name : "tkldool"
/// category_id : 10
/// logo : "1648677263.png"
/// location : "2gdfgdfgb gghgh"
/// region : 2
/// city : 5
/// longitude : "343434"
/// latitude : "3243442343"
/// phone : "01119204494"
/// status : null
/// delivery_price : "3.00"

class CategortIdModel {
  CategortIdModel({
      int? id, 
      String? arName, 
      String? enName, 
      int? categoryId, 
      String? logo, 
      String? location, 
      int? region, 
      int? city, 
      String? longitude, 
      String? latitude, 
      String? phone, 
      dynamic status, 
      String? deliveryPrice,}){
    _id = id;
    _arName = arName;
    _enName = enName;
    _categoryId = categoryId;
    _logo = logo;
    _location = location;
    _region = region;
    _city = city;
    _longitude = longitude;
    _latitude = latitude;
    _phone = phone;
    _status = status;
    _deliveryPrice = deliveryPrice;
}

  CategortIdModel.fromJson(dynamic json) {
    _id = json['id'];
    _arName = json['ar_name'];
    _enName = json['en_name'];
    _categoryId = json['category_id'];
    _logo = json['logo'];
    _location = json['location'];
    _region = json['region'];
    _city = json['city'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _phone = json['phone'];
    _status = json['status'];
    _deliveryPrice = json['delivery_price'];
  }
  int? _id;
  String? _arName;
  String? _enName;
  int? _categoryId;
  String? _logo;
  String? _location;
  int? _region;
  int? _city;
  String? _longitude;
  String? _latitude;
  String? _phone;
  dynamic _status;
  String? _deliveryPrice;

  int? get id => _id;
  String? get arName => _arName;
  String? get enName => _enName;
  int? get categoryId => _categoryId;
  String? get logo => _logo;
  String? get location => _location;
  int? get region => _region;
  int? get city => _city;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get phone => _phone;
  dynamic get status => _status;
  String? get deliveryPrice => _deliveryPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ar_name'] = _arName;
    map['en_name'] = _enName;
    map['category_id'] = _categoryId;
    map['logo'] = _logo;
    map['location'] = _location;
    map['region'] = _region;
    map['city'] = _city;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['phone'] = _phone;
    map['status'] = _status;
    map['delivery_price'] = _deliveryPrice;
    return map;
  }

}