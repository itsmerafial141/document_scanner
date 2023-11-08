// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';

String normalizeNikText(String text) {
  String result = text.toUpperCase();

  result = result.replaceAll("NIK", "").replaceAll(":", "").trim();

  return result;
}

String normalizeNamaText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("NEMA", "")
      .replaceAll("NAME", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizeJenisKelaminText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("GOL. DARAHO", "")
      .replaceAll("GOL. DARAH", "")
      .replaceAll("GOL DARAH", "")
      .replaceAll("LAKFEARI", "")
      .replaceAll("LAKFLAK", "")
      .replaceAll("KELAMIN", "")
      .replaceAll("KEIAMIN", "")
      .replaceAll("JENIS", "")
      .replaceAll("DENIS", "")
      .replaceAll("DARAH ", "")
      .replaceAll("ENIS", "")
      .replaceAll("DARA", "")
      .replaceAll("GO", "")
      .replaceAll("L. ", "")
      .replaceAll(" H0", "")
      .replaceAll(" HO", "")
      .replaceAll(":", "")
      .replaceAll(" 0", "")
      .replaceAll(" O", "")
      .trim();

  if (result == "LAK-LAK" ||
      result == "LAKI-LAK" ||
      result == "AK-LAK" ||
      result == "LAKFLAKI" ||
      result == "LAKHLAK" ||
      result == "LAKFEAKI" ||
      result == "LAKELAKI" ||
      result == "LAKELAK" ||
      result == "LAKHLAKI" ||
      result == "LAKHEAK" ||
      result == "LAK-LAKI" ||
      result == "LAKHEAKI" ||
      result == "LAKIFEAK" ||
      result == "LAKFEAKE" ||
      result == "LAKIFEAKI" ||
      result == "LAKFEAR" ||
      result == "LAKFLAK" ||
      result == "LAK-LAKE" ||
      result == "LAK-EAK" ||
      result == "LAKFEAK" ||
      result == "LAK-EAKI" ||
      result == "LAKELAKE") {
    return "Laki-Laki";
  }

  return result;
}

String normalizeAlamatText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("RI/KEILDESAA", "")
      .replaceAll("RTKELIIDESAA", "")
      .replaceAll("TIKEL/LDESA", "")
      .replaceAll("RTKEL/DESAA", "")
      .replaceAll("RTKELVDESA", "")
      .replaceAll("RIKELBESAA", "")
      .replaceAll("KECAMATAN", "")
      .replaceAll("KEL/DESSA", "")
      .replaceAll("KELIDESAA", "")
      .replaceAll("KELI/DESA", "")
      .replaceAll("KELILDESA", "")
      .replaceAll("KELIIDESA", "")
      .replaceAll("KELILDESA", "")
      .replaceAll("KEL/ DESA", "")
      .replaceAll("KELLIDESA", "")
      .replaceAll("KECAMATDN", "")
      .replaceAll("HECAMATAN", "")
      .replaceAll("KEILIBESA", "")
      .replaceAll("KELILBESA", "")
      .replaceAll("NECAMATAN", "")
      .replaceAll("KELL/DESA", "")
      .replaceAll("KEL/DESAA", "")
      .replaceAll("KELLDESAA", "")
      .replaceAll("KEL/DESA", "")
      .replaceAll("KELLIBES", "")
      .replaceAll("KEI/DESA", "")
      .replaceAll("HELLDESA", "")
      .replaceAll("KELIBESA", "")
      .replaceAll("KELLBESA", "")
      .replaceAll("KEL/DESA", "")
      .replaceAll("KELLDESA", "")
      .replaceAll("KEILDESA", "")
      .replaceAll("KEILBESA", "")
      .replaceAll("KELIDESA", "")
      .replaceAll("KEVDESA", "")
      .replaceAll("KEVBESA", "")
      .replaceAll("KELBESA", "")
      .replaceAll("KE/DESA", "")
      .replaceAll("ELLDESA", "")
      .replaceAll("KELDESA", "")
      .replaceAll("ALAMAT", "")
      .replaceAll("LAMAT", "")
      .replaceAll("RTIRW", "")
      .replaceAll("RT/RW", "")
      .replaceAll("ELDESA", "")
      .replaceAll("KEVDES", "")
      .replaceAll("RTIRWN", "")
      .replaceAll(" TIA ", " ")
      .replaceAll("RT ", "")
      .replaceAll("RT/ ", "")
      .replaceAll("RW ", "")
      .replaceAll(":", "")
      .replaceAll("=", "")
      .replaceAll("  ", " ")
      .trim();

  return result;
}

String normalizeKawinText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("PERKAWINAN", "")
      .replaceAll("PERKAWINA", "")
      .replaceAll("STATUS", "")
      .replaceAll("TATUS", "")
      .replaceAll("STAFUS", "")
      .replaceAll("R ", "")
      .replaceAll("T ", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizePekerjaanText(String text) {
  String result = text.toUpperCase();

  result = result.replaceAll("PEKERJAAN", "").replaceAll(":", "").trim();

  if (result == "PELAJARIMAHASISSWA" ||
      result == "PELAJARIMAHASISWA" ||
      result == "PELAJARIMAHASISVWA" ||
      result == "PELAJARMAHASISWA") {
    return "Pelajar/Mahasiswa";
  }
  return result;
}

String normalizeKewarganegaraanText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("KEWARGANEGARAAN", "")
      .replaceAll("EUMUR", "")
      .replaceAll("HDUP", "")
      .replaceAll("H ", "")
      .replaceAll("N ", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizeAgamaText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("AGAMA", "")
      .replaceAll(":", "")
      .replaceAll("GAMA", "")
      .trim();

  if (result == "SLAM" ||
      result == "AM" ||
      result == "SLA AM" ||
      result == "ISLU AM" ||
      result == "SL LAM" ||
      result == "ISLAME" ||
      result == "SLA M" ||
      result == "ISL AM" ||
      result == "ISLA AM" ||
      result == "S AM" ||
      result == "SLL AM" ||
      result == "SL AM" ||
      result == "SE AM" ||
      result == "1SLAM" ||
      result == "ISLAMM" ||
      result == "SLA" ||
      result == "LAM") {
    result = "Islam";
  }
  if (result.trim().isEmpty) {
    return "";
  } else {
    return result;
  }
}

bool checkNikField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "nik";
}

bool checkNamaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "nama" || text == "nema" || text == "name";
}

bool checkTglLahirField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "lahir" ||
      text == "tempat" ||
      text == "tempatigllahir" ||
      text == "empatgllahir" ||
      text == "tempat/tgl";
}

bool checkJenisKelaminField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kelamin" || text == "jenis";
}

bool checkAlamatField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "alamat" ||
      text == "lamat" ||
      text == "alaahom" ||
      text == "alama" ||
      text == "alamao" ||
      text == "alamarw";
}

bool checkRtRwField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "rt/rw" || text == "rw " || text == "rt" || text == "rtirw";
}

bool checkKelDesaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kel/desa" || text == "helldesa" || text == "kelldesa";
}

bool checkKecamatanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kecamatan" || dataText.contains("kecamatan");
}

bool checkAgamaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "agama" || text == "gama";
}

bool checkKawinField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kawin" || text == "perkawinan" || text == "perkawinan:";
}

bool checkPekerjaanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kerja" || text == "pekerjaan";
}

bool checkKewarganegaraanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kewarganegaraan" ||
      text == "negaraan" ||
      text == "kewarganegaraan:";
}

bool isInside(Rect rect, Rect isInside) {
  if (rect == null) {
    return false;
  }

  if (isInside == null) {
    return false;
  }

  if (rect.center.dy <= isInside.bottom &&
      rect.center.dy >= isInside.top &&
      rect.center.dx >= isInside.right &&
      rect.center.dx <= 650) {
    return true;
  }

  return false;
}

bool isInside3Rect({Rect? isThisRect, Rect? isInside, Rect? andAbove}) {
  if (isThisRect == null) {
    return false;
  }

  if (isInside == null) {
    return false;
  }

  if (andAbove == null) {
    return false;
  }

  if (isThisRect.center.dy <= andAbove.top &&
      isThisRect.center.dy >= isInside.top &&
      isThisRect.center.dx >= isInside.left) {
    return true;
  }

  return false;
}
