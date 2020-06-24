import 'package:musicboxflutter/logging/log.dart';

class LogImpl implements Log {
  @override
  void error(String message, {String tag}) {
    print("[ERROR] $tag $message");
  }

  @override
  void info(String message, {String tag}) {
    print("[INFO] $tag $message");
  }

}