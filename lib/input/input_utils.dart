import 'dart:convert';
import 'dart:io';

class InputUtils {
  List<String> inputToListString(String path) {
    return File(path).readAsStringSync().split("\n");
  }

  Stream<String> inputAsStream(String path, {bool splitAtEmpty = true}) {
    var streamFile = File(path).openRead().transform(utf8.decoder);
    if (splitAtEmpty) return streamFile.transform(LineSplitter());

    return streamFile;
  }
}

