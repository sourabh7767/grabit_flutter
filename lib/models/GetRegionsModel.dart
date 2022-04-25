/// id : 1
/// region_name_ar : "القاهره"
/// region_name_en : "Cairo"

class GetRegionsModel {
  GetRegionsModel({
      int? id, 
      String? regionNameAr, 
      String? regionNameEn,}){
    _id = id;
    _regionNameAr = regionNameAr;
    _regionNameEn = regionNameEn;
}

  GetRegionsModel.fromJson(dynamic json) {
    _id = json['id'];
    _regionNameAr = json['region_name_ar'];
    _regionNameEn = json['region_name_en'];
  }
  int? _id;
  String? _regionNameAr;
  String? _regionNameEn;

  int? get id => _id;
  String? get regionNameAr => _regionNameAr;
  String? get regionNameEn => _regionNameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['region_name_ar'] = _regionNameAr;
    map['region_name_en'] = _regionNameEn;
    return map;
  }

}