import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ocr_kk/app/core/enums/image_from_enum.dart';
import 'package:ocr_kk/app/core/themes/colors/app_colors_swatch.dart';

class SelectImageDialog extends StatelessWidget {
  const SelectImageDialog({super.key, required this.onPressed});

  final Function(ImageFrom method) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _mainButton(ImageFrom.CAMERA),
        Gap(16.w),
        _mainButton(ImageFrom.GALERY),
      ],
    );
  }

  Widget _mainButton(ImageFrom from) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: const LinearGradient(
            colors: [AppColorSwatch.INFO, AppColorSwatch.SUCCESS],
          ),
        ),
        child: MaterialButton(
          onPressed: () => onPressed(from),
          color: Colors.transparent,
          padding: EdgeInsets.all(16.r),
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Icon(
                from == ImageFrom.CAMERA
                    ? Icons.camera_alt_outlined
                    : Icons.image_outlined,
                color: Colors.white,
              ),
              Text(
                from == ImageFrom.CAMERA ? "Camera" : "Galery",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
