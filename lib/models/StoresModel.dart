/// bundles : []
/// items : [{"id":2,"ar_item_name":"tyrert","en_item_name":"ertrt","ar_description":"rtretret","en_description":"ertet","sub_category_id":2,"store_id":1,"price":"3.00","discount":"43","price_time_out":0,"status":1,"img":"1647730424.jpg","stock":3,"created_at":"-000001-11-30T00:00:00.000000Z","updated_at":"-000001-11-30T00:00:00.000000Z"},{"id":3,"ar_item_name":"fdgdfgdf","en_item_name":"فقفقثفقثف","ar_description":"فقثفقثفقثف","en_description":"قفثفقثفقف","sub_category_id":2,"store_id":1,"price":"34.00","discount":"34","price_time_out":null,"status":1,"img":"1648316843.png","stock":43,"created_at":"2022-03-26T19:47:23.000000Z","updated_at":null}]

class StoresModel {
  StoresModel({
    List<dynamic>? bundles,
    List<Items>? items,
  }) {
    _bundles = bundles;
    _items = items;
  }

  StoresModel.fromJson(dynamic json) {
    if (json['bundles'] != null) {
      _bundles = [];
      // json['bundles'].forEach((v) {
      //   _bundles?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  List<dynamic>? _bundles;
  List<Items>? _items;

  List<dynamic>? get bundles => _bundles;

  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_bundles != null) {
      map['bundles'] = _bundles?.map((v) => v.toJson()).toList();
    }
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// ar_item_name : "tyrert"
/// en_item_name : "ertrt"
/// ar_description : "rtretret"
/// en_description : "ertet"
/// sub_category_id : 2
/// store_id : 1
/// price : "3.00"
/// discount : "43"
/// price_time_out : 0
/// status : 1
/// img : "1647730424.jpg"
/// stock : 3
/// created_at : "-000001-11-30T00:00:00.000000Z"
/// updated_at : "-000001-11-30T00:00:00.000000Z"

class Items {
  Items({
    int? id,
    String? arItemName,
    String? enItemName,
    String? arDescription,
    String? enDescription,
    int? subCategoryId,
    int? storeId,
    String? price,
    String? discount,
    int? priceTimeOut,
    int? status,
    String? img,
    int? stock,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _arItemName = arItemName;
    _enItemName = enItemName;
    _arDescription = arDescription;
    _enDescription = enDescription;
    _subCategoryId = subCategoryId;
    _storeId = storeId;
    _price = price;
    _discount = discount;
    _priceTimeOut = priceTimeOut;
    _status = status;
    _img = img;
    _stock = stock;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _arItemName = json['ar_item_name'];
    _enItemName = json['en_item_name'];
    _arDescription = json['ar_description'];
    _enDescription = json['en_description'];
    _subCategoryId = json['sub_category_id'];
    _storeId = json['store_id'];
    _price = json['price'];
    _discount = json['discount'];
    _priceTimeOut = json['price_time_out'];
    _status = json['status'];
    _img = json['img'];
    _stock = json['stock'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _arItemName;
  String? _enItemName;
  String? _arDescription;
  String? _enDescription;
  int? _subCategoryId;
  int? _storeId;
  String? _price;
  String? _discount;
  int? _priceTimeOut;
  int? _status;
  String? _img;
  int? _stock;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get arItemName => _arItemName;

  String? get enItemName => _enItemName;

  String? get arDescription => _arDescription;

  String? get enDescription => _enDescription;

  int? get subCategoryId => _subCategoryId;

  int? get storeId => _storeId;

  String? get price => _price;

  String? get discount => _discount;

  int? get priceTimeOut => _priceTimeOut;

  int? get status => _status;

  String? get img => _img;

  int? get stock => _stock;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ar_item_name'] = _arItemName;
    map['en_item_name'] = _enItemName;
    map['ar_description'] = _arDescription;
    map['en_description'] = _enDescription;
    map['sub_category_id'] = _subCategoryId;
    map['store_id'] = _storeId;
    map['price'] = _price;
    map['discount'] = _discount;
    map['price_time_out'] = _priceTimeOut;
    map['status'] = _status;
    map['img'] = _img;
    map['stock'] = _stock;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
