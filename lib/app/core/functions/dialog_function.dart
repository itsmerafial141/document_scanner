import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DialogFunctions {
  static void mainDialog({required Widget widget}) {
    Get.dialog(
      Container(
        margin: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showLoading() {
    mainDialog(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Gap(8.h),
          const Text("Loading..."),
        ],
      ),
    );
  }

  static void showProblem({String? message, Function()? onPressed}) {
    mainDialog(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.dangerous_outlined,
            color: Colors.red,
            size: 50,
          ),
          Gap(8.h),
          Text(
            message ?? "Terjadi Kesalahan",
            textAlign: TextAlign.center,
          ),
          if (onPressed != null)
            Column(
              children: [
                Gap(8.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("Ok"),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  static void showSuccess({String? message, Function()? onPressed}) {
    mainDialog(
      widget: Column(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.green,
            size: 50,
          ),
          Gap(8.h),
          Text(message ?? "Berhasil!"),
          if (onPressed != null)
            Column(
              children: [
                Gap(8.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("Ok"),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  static void closeLoading() {
    closeDialog();
  }

  static void closeDialog() {
    Get.closeAllSnackbars();
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
