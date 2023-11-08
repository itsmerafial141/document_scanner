// To parse this JSON data, do
//
//     final familyCardNumberModel = familyCardNumberModelFromJson(jsonString);

import 'dart:convert';

FamilyCardNumberModel familyCardNumberModelFromJson(String str) =>
    FamilyCardNumberModel.fromJson(json.decode(str));

String familyCardNumberModelToJson(FamilyCardNumberModel data) =>
    json.encode(data.toJson());

class FamilyCardNumberModel {
  String? province;
  String? district;
  String? subDistrict;

  FamilyCardNumberModel({
    this.province,
    this.district,
    this.subDistrict,
  });

  factory FamilyCardNumberModel.fromJson(Map<String, dynamic> json) =>
      FamilyCardNumberModel(
        province: json["province"] ?? "",
        district: json["district"] ?? "",
        subDistrict: json["sub_district"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "province": province,
        "district": district,
        "sub_district": subDistrict,
      };
}
