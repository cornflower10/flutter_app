import 'package:flutter/material.dart';
import 'package:flutter_app/api/Contants.dart';

class LogUtils {
  static void collectLog(String line) {
    d(line);
  }

  static void reportLog(FlutterErrorDetails details) {
    collectLog(details.exceptionAsString());
  }

  static FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
    d("makeDetails"+obj);
    return FlutterErrorDetails(stack: stack);
  }

  static void d(String line) {
    if (Contants.debug) {
      debugPrint(line);
    }
  }
}
