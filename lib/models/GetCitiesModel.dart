/// id : 1
/// area_name_ar : "مدينه نصر"
/// area_name_en : "Nasr City"
/// region_id : 1

class GetCitiesModel {
  GetCitiesModel({
      int? id, 
      String? areaNameAr, 
      String? areaNameEn, 
      int? regionId,}){
    _id = id;
    _areaNameAr = areaNameAr;
    _areaNameEn = areaNameEn;
    _regionId = regionId;
}

  GetCitiesModel.fromJson(dynamic json) {
    _id = json['id'];
    _areaNameAr = json['area_name_ar'];
    _areaNameEn = json['area_name_en'];
    _regionId = json['region_id'];
  }
  int? _id;
  String? _areaNameAr;
  String? _areaNameEn;
  int? _regionId;

  int? get id => _id;
  String? get areaNameAr => _areaNameAr;
  String? get areaNameEn => _areaNameEn;
  int? get regionId => _regionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['area_name_ar'] = _areaNameAr;
    map['area_name_en'] = _areaNameEn;
    map['region_id'] = _regionId;
    return map;
  }

}