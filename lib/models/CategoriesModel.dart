/// id : 10
/// category_name : "koshary"
/// category_name_ar : "كشري"
/// description : "koshary"
/// description_ar : "كشري"
/// img : "1644335042.jpg"

class CategoriesModel {
  CategoriesModel({
      int? id, 
      String? categoryName, 
      String? categoryNameAr, 
      String? description, 
      String? descriptionAr, 
      String? img,}){
    _id = id;
    _categoryName = categoryName;
    _categoryNameAr = categoryNameAr;
    _description = description;
    _descriptionAr = descriptionAr;
    _img = img;
}

  CategoriesModel.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categoryNameAr = json['category_name_ar'];
    _description = json['description'];
    _descriptionAr = json['description_ar'];
    _img = json['img'];
  }
  int? _id;
  String? _categoryName;
  String? _categoryNameAr;
  String? _description;
  String? _descriptionAr;
  String? _img;

  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryNameAr => _categoryNameAr;
  String? get description => _description;
  String? get descriptionAr => _descriptionAr;
  String? get img => _img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['category_name_ar'] = _categoryNameAr;
    map['description'] = _description;
    map['description_ar'] = _descriptionAr;
    map['img'] = _img;
    return map;
  }

}