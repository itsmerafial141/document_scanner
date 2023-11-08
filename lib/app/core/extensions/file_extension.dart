import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

extension FileExtension on File {
  File renameFileWithDateTime({String prefix = 'File'}) {
    String tempFileName = path.split('/').last;
    String formatFile = tempFileName.split(".").last;
    String fileDir = dirname(path);
    String newPath = join(
      fileDir,
      '$prefix-${DateFormat("ddMMyy-HH:mm").format(DateTime.now())}.$formatFile',
    );

    return File(path).renameSync(newPath);
  }
}
