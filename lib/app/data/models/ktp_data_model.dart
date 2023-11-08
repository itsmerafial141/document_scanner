import 'package:ocr_kk/app/core/functions/ktp_function.dart';

class KtpDataEntityConverter extends KtpDataEntity {
  KtpDataEntityConverter({
    required nik,
    required namaLengkap,
    required tanggalLahir,
    required alamatFull,
    required alamat,
    required rtrw,
    required kecamatan,
    required kelDesa,
    required agama,
    required statusPerkawinan,
    required tempatLahir,
    required jenisKelamin,
    required golDarah,
    required pekerjaan,
    required kewarganegaraan,
    required berlakuHingga,
  }) : super(
            namaLengkap: namaLengkap,
            tanggalLahir: tanggalLahir,
            alamatFull: alamatFull,
            agama: agama,
            alamat: alamat,
            rtrw: rtrw,
            kelDesa: kelDesa,
            kecamatan: kecamatan,
            statusPerkawinan: statusPerkawinan,
            nik: nik,
            tempatLahir: tempatLahir,
            jenisKelamin: jenisKelamin,
            golDarah: golDarah,
            pekerjaan: pekerjaan,
            kewarganegaraan: kewarganegaraan,
            berlakuHingga: berlakuHingga);

  factory KtpDataEntityConverter.from({
    required nik,
    required namaLengkap,
    required tanggalLahir,
    required alamatFull,
    required alamat,
    required rtrw,
    required kelDesa,
    required kecamatan,
    required agama,
    required statusPerkawinan,
    required tempatLahir,
    required jenisKelamin,
    required golDarah,
    required pekerjaan,
    required kewarganegaraan,
    required berlakuHingga,
  }) {
    return KtpDataEntityConverter(
        nik: normalizeNikText(nik),
        namaLengkap: normalizeNamaText(namaLengkap).trim(),
        tanggalLahir: tanggalLahir,
        alamatFull: normalizeAlamatText(alamatFull),
        agama: normalizeAgamaText(agama),
        statusPerkawinan: normalizeKawinText(statusPerkawinan),
        tempatLahir: normalizeAlamatText(tanggalLahir),
        jenisKelamin: normalizeJenisKelaminText(jenisKelamin),
        golDarah: golDarah,
        pekerjaan: normalizePekerjaanText(pekerjaan),
        kewarganegaraan: normalizeKewarganegaraanText(kewarganegaraan),
        berlakuHingga: berlakuHingga,
        rtrw: normalizeAlamatText(rtrw),
        kelDesa: normalizeAlamatText(kelDesa),
        alamat: normalizeAlamatText(alamat),
        kecamatan: normalizeAlamatText(kecamatan));
  }
}

class KtpDataEntity {
  final String nik;
  final String namaLengkap;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenisKelamin;
  final String golDarah;
  final String alamatFull;
  final String alamat;
  final String rtrw;
  final String kelDesa;
  final String kecamatan;
  final String agama;
  final String statusPerkawinan;
  final String pekerjaan;
  final String kewarganegaraan;
  final String berlakuHingga;

  KtpDataEntity({
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.alamatFull,
    required this.agama,
    required this.alamat,
    required this.rtrw,
    required this.kelDesa,
    required this.kecamatan,
    required this.statusPerkawinan,
    required this.nik,
    required this.tempatLahir,
    required this.jenisKelamin,
    required this.golDarah,
    required this.pekerjaan,
    required this.kewarganegaraan,
    required this.berlakuHingga,
  });
}
