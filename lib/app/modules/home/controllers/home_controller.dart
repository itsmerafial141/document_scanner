import 'dart:io';
import 'dart:typed_data';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:ocr_kk/app/core/enums/document_type_enum.dart';
import 'package:ocr_kk/app/core/enums/image_from_enum.dart';
import 'package:ocr_kk/app/core/extensions/file_extension.dart';
import 'package:ocr_kk/app/core/extensions/document_extension.dart';
import 'package:ocr_kk/app/core/functions/dialog_function.dart';
import 'package:ocr_kk/app/core/functions/dialogs/select_image_dialog.dart';
import 'package:ocr_kk/app/core/functions/ktp_function.dart';
import 'package:ocr_kk/app/core/helper/rx_nullabel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  late Rx<File?> selectedImage;
  late Rx<File?> selectedImageEktp;
  late Rx<File?> selectedImageOther;
  late Rx<InputImage?> selectedInputImage;

  late RxBool isKkPreviewed;
  late RxBool isEktpPreviewed;
  late RxBool isOtherPreviewed;
  late RxBool isEktpValid;
  late RxBool isKKValid;
  late RxBool isOtherValid;

  String getDialogErrorMessage(DocumentType docType) {
    switch (docType) {
      case DocumentType.eKTP:
        return "Format e-KTP tidak sesuai!";
      case DocumentType.KK:
        return "Format kartu keluarga tidak sesuai!";
      default:
        return "Format document tidak sesuai!";
    }
  }

  String getDialogSuccessMessage(DocumentType docType) {
    switch (docType) {
      case DocumentType.eKTP:
        return "Dokumen e-KTP berhasil diupload!";
      case DocumentType.KK:
        return "Dokumen kartu keluarga berhasil diupload!";
      case DocumentType.AKTA_KELAHIRAN:
        return "Dokumen akta kelahiran berhasil diupload!";
      case DocumentType.IJAZAH:
        return "Dokumen ijazah berhasil diupload!";
      case DocumentType.AKTA_PERKAWINAN:
        return "Dokumen akta perkawinan berhasil diupload!";
      case DocumentType.BUKU_NIKAH:
        return "Dokumen buku nikah berhasil diupload!";
      case DocumentType.SURAT_BAPTIS:
        return "Dokumen surat baptis berhasil diupload!";
      default:
        return "Dokumen berhasil diupload!";
    }
  }

  @override
  void dispose() {
    selectedImage.close();
    selectedImageEktp.close();
    selectedImageOther.close();
    selectedInputImage.close();
    // familyCardNumberData.close();
    // noKk.close();
    isKkPreviewed.close();
    isEktpPreviewed.close();
    isOtherPreviewed.close();
    isEktpValid.close();
    isKKValid.close();
    isOtherValid.close();
    super.dispose();
  }

  @override
  void onInit() {
    selectedImage = RxNullable<File?>().setNull();
    selectedImageEktp = RxNullable<File?>().setNull();
    selectedImageOther = RxNullable<File?>().setNull();
    selectedInputImage = RxNullable<InputImage?>().setNull();
    // familyCardNumberData = RxNullable<FamilyCardNumberModel?>().setNull();
    // noKk = "".obs;

    isKkPreviewed = false.obs;
    isEktpPreviewed = false.obs;
    isOtherPreviewed = false.obs;

    isEktpValid = false.obs;
    isKKValid = false.obs;
    isOtherValid = false.obs;
    super.onInit();
  }

  void onUploadDocumentTapped(BuildContext context) async {
    DialogFunctions.mainDialog(
      widget: SelectImageDialog(
        onPressed: (method) {
          DialogFunctions.closeDialog();
          getImageWithCropper(method, DocumentType.KK);
        },
      ),
    );
  }

  void getImageWithCropper(ImageFrom method, DocumentType docType) async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }
    if (!isCameraGranted) {
      return;
    }

    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    if (method == ImageFrom.CAMERA) {
      try {
        //Make sure to await the call to detectEdge.
        await EdgeDetection.detectEdge(
          imagePath,
          canUseGallery: true,
          androidCropTitle: 'Crop',
          androidCropBlackWhiteTitle: 'Black White',
          androidCropReset: 'Reset',
        ).then((value) {
          if (value) _converterImage(imagePath, docType);
        });
      } catch (e) {
        e.printError();
        DialogFunctions.showProblem(
          message: "Edge not detected!",
          onPressed: () => DialogFunctions.closeDialog(),
        );
      }
    } else {
      try {
        //Make sure to await the call to detectEdgeFromGallery.
        await EdgeDetection.detectEdgeFromGallery(
          imagePath,
          androidCropBlackWhiteTitle: 'Black White',
          androidCropReset: 'Reset',
        ).then((value) {
          if (value) _converterImage(imagePath, docType);
        });
      } catch (e) {
        e.printError();
        DialogFunctions.showProblem(
          message: "Edge not detected!",
          onPressed: () => DialogFunctions.closeDialog(),
        );
      }
    }
  }

  void _converterImage(String imagePath, DocumentType docType) async {
    var file = File(imagePath).renameFileWithDateTime(
      prefix: "IMG",
    );
    img.Image image = img.decodeImage(file.readAsBytesSync())!;
    int resizeHeight = 0;
    int resizeWidth = 0;
    if (image.height > image.width) {
      if (docType == DocumentType.eKTP) {
        resizeHeight = image.height;
        resizeWidth = (image.height / 1.58).round();
      } else {
        resizeHeight = image.height;
        resizeWidth = (image.height * (3 / 4)).round();
      }
    } else {
      if (docType == DocumentType.eKTP) {
        resizeHeight = (image.width / 1.58).round();
        resizeWidth = image.width;
      } else {
        resizeHeight = (image.width * (3 / 4)).round();
        resizeWidth = image.width;
      }
    }
    img.Image resizeImage = img.copyResize(
      image,
      height: resizeHeight,
      width: resizeWidth,
    );
    Uint8List resizeByte = img.encodePng(resizeImage);
    File tempFile = await File(imagePath).writeAsBytes(resizeByte);
    switch (docType) {
      case DocumentType.eKTP:
        selectedImageEktp.value = tempFile;
        break;
      case DocumentType.KK:
        selectedImage.value = tempFile;
        break;
      default:
        selectedImageOther.value = tempFile;
        break;
    }
    selectedInputImage.value = InputImage.fromFile(tempFile);
    if (docType == DocumentType.eKTP) {
      _processedEktpImage(selectedInputImage.value!, docType);
    } else {
      _processedImage(selectedInputImage.value!, docType);
    }
  }

  void selectImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    selectedInputImage.value = null;
    final ImagePicker picker = ImagePicker();
    var xFile = await picker.pickImage(
      source: source,
    );
    if (xFile != null) {
      selectedImage.value = File(xFile.path).renameFileWithDateTime(
        prefix: "IMG",
      );
      selectedInputImage.value = InputImage.fromFile(selectedImage.value!);
      selectedInputImage.value = InputImage.fromFile(selectedImageEktp.value!);
      selectedInputImage.value = InputImage.fromFile(selectedImageOther.value!);
      _processedImage(selectedInputImage.value!, DocumentType.KK);
    } else {
      return null;
    }
  }

  void _processedEktpImage(
    InputImage inputImage,
    DocumentType docType,
  ) async {
    DialogFunctions.showLoading();
    final visionText = await textRecognizer.processImage(inputImage);
    Rect? nikRect;
    bool isNikDetected = false;
    for (var block in visionText.blocks) {
      for (var line in block.lines) {
        for (var element in line.elements) {
          if (checkNikField(element.text)) {
            nikRect = element.boundingBox;
          }
        }
      }
    }
    for (var block in visionText.blocks) {
      for (var line in block.lines) {
        for (var element in line.elements) {
          if (nikRect != null) {
            if (element.boundingBox.center.dy >= nikRect.top &&
                element.boundingBox.center.dy <= nikRect.bottom &&
                element.boundingBox.left >= nikRect.right) {
              isNikDetected = true;
            }
          }
        }
      }
    }
    DialogFunctions.closeLoading();
    if (isNikDetected && visionText.text.toLowerCase().contains("provinsi")) {
      isEktpValid.value = true;
      DialogFunctions.showSuccess(
        message: getDialogSuccessMessage(docType),
        onPressed: () => DialogFunctions.closeDialog(),
      );
    } else {
      isEktpValid.value = false;
      DialogFunctions.showProblem(
        message: getDialogErrorMessage(docType),
        onPressed: () => DialogFunctions.closeDialog(),
      );
    }
  }

  void _processedImage(InputImage inputImage, DocumentType docType) async {
    DialogFunctions.showLoading();
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );
    bool isDocumentValid = false;
    var documentType = docType;
    for (TextBlock block in recognizedText.blocks) {
      if (docType == DocumentType.KK) {
        if (block.text.isKartuKeluarga) {
          isDocumentValid = true;
          isKKValid.value = true;
          documentType = DocumentType.KK;
          break;
        } else {
          isKKValid.value = false;
        }
      } else {
        if (block.text.isAkteKelahiran) {
          isDocumentValid = true;
          isOtherValid.value = true;
          documentType = DocumentType.AKTA_KELAHIRAN;
          break;
        } else if (block.text.isIjazah) {
          isDocumentValid = true;
          isOtherValid.value = true;
          documentType = DocumentType.IJAZAH;
          break;
        } else if (block.text.isAktaPerkawinan) {
          isDocumentValid = true;
          isOtherValid.value = true;
          documentType = DocumentType.AKTA_PERKAWINAN;
          break;
        } else if (block.text.isBukuNikah) {
          isDocumentValid = true;
          isOtherValid.value = true;
          documentType = DocumentType.BUKU_NIKAH;
          break;
        } else if (block.text.isSuratBaptis) {
          isDocumentValid = true;
          isOtherValid.value = true;
          documentType = DocumentType.SURAT_BAPTIS;
          break;
        } else {
          isOtherValid.value = false;
          isDocumentValid = false;
        }
      }
    }

    DialogFunctions.closeLoading();
    if (isDocumentValid) {
      DialogFunctions.showSuccess(
        message: getDialogSuccessMessage(documentType),
        onPressed: () => DialogFunctions.closeDialog(),
      );
    } else {
      DialogFunctions.showProblem(
        message: getDialogErrorMessage(documentType),
        onPressed: () => DialogFunctions.closeDialog(),
      );
    }
  }
}
