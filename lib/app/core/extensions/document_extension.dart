import 'dart:developer';

import 'package:get/get.dart';
import 'package:ocr_kk/app/core/extensions/string_extension.dart';
import 'package:ocr_kk/app/data/models/family_card_number_model.dart';
import 'package:ocr_kk/app/core/const/code_wilayah_const.dart';

extension DocumentExtesion on String {
  FamilyCardNumberModel? get getLocationByKk {
    try {
      var provinceSelector = "${substring(0, 2)}: ";
      var districtSelector = "${substring(0, 4)}: ";
      var subdistrictSelector = "${substring(0, 6)}: ";

      var provinceValidation = listCodeWilayahKK.where((element) {
        if (element.length >= 4) {
          return element.substring(0, 4) == provinceSelector;
        } else {
          return false;
        }
      });

      var districtValidation = listCodeWilayahKK.where((element) {
        if (element.length >= 6) {
          return element.substring(0, 7).replaceAll(".", "") ==
              districtSelector;
        } else {
          return false;
        }
      });
      var subdistrictValidation = listCodeWilayahKK.where((element) {
        if (element.length >= 10) {
          return element.substring(0, 10).replaceAll(".", "") ==
              subdistrictSelector;
        } else {
          return false;
        }
      });

      String province = "";
      String district = "";
      String subdistrict = "";

      if (provinceValidation.isNotEmpty) {
        province = provinceValidation.first;
      }
      if (districtValidation.isNotEmpty) {
        district = districtValidation.first;
      }
      if (subdistrictValidation.isNotEmpty) {
        subdistrict = subdistrictValidation.first;
      }

      var completeProvince =
          province.replaceAll(provinceSelector, "").capitalize;
      var completeDistrict = district
          .replaceAll(".", "")
          .replaceAll(districtSelector, "")
          .capitalize;
      var completeSubdisctrict = subdistrict
          .replaceAll(".", "")
          .replaceAll(subdistrictSelector, "")
          .capitalize;

      return FamilyCardNumberModel(
        province: completeProvince,
        district: completeDistrict,
        subDistrict: completeSubdisctrict,
      );
    } catch (e) {
      return null;
    }
  }

  String get getKartuKeluargaNumber {
    return removeAllWhitespace.removeAllSymbolic
        .toLowerCase()
        .replaceAll("no", "")
        .replaceLetterToNumber;
  }

  String get _getCleanDocument =>
      replaceNumberToLetter.removeAllWhitespace.removeAllSymbolic.toLowerCase();

  bool get isEktp {
    var nik = replaceNumberToLetter.removeAllWhitespace.removeAllSymbolic;
    if (nik.length == 16) {
      try {
        var provinceCode = substring(0, 3);
        var districtCode = substring(2, 4);
        var subDistrictCode = substring(4, 6);

        var provinceFilter = "$provinceCode:";
        var districtFilter = "$provinceCode.$districtCode:";
        var subDistrictFilter = "$districtCode.$subDistrictCode:";

        var provinceName = listCodeWilayahKK.where((element) {
          return element.substring(0, 3) == provinceFilter;
        }).first;
        var districtName = listCodeWilayahKK.where((element) {
          return element.substring(0, 6) == districtFilter;
        }).first;
        var subDistrictName = listCodeWilayahKK.where((element) {
          return element.substring(0, 9) == subDistrictFilter;
        }).first;
        log(provinceName, name: "provinceName");
        log(districtName, name: "districtName");
        log(subDistrictName, name: "subDistrictName");
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  bool get isKartuKeluarga {
    return _getCleanDocument.contains('kartukeluarga');
  }

  bool get isAkteKelahiran {
    return _getCleanDocument.contains('aktakelahiran');
  }

  bool get isIjazah {
    return _getCleanDocument.contains('ijazah') ||
        _getCleanDocument.contains('kementerianpendidikan');
  }

  bool get isAktaPerkawinan {
    return _getCleanDocument.contains('aktaperkawinan');
  }

  bool get isBukuNikah {
    return _getCleanDocument.contains('aktanikah');
  }

  bool get isSuratBaptis {
    return _getCleanDocument.contains('baptis') ||
        _getCleanDocument.contains('permandian');
  }
}
