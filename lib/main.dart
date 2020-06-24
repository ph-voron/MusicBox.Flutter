import 'package:flutter/material.dart';
import 'package:musicboxflutter/logging/log_impl.dart';

import 'app.dart';

void main() {
  runApp(MusicBoxApp(
    log: LogImpl(),
  ));
}
