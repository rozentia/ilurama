import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void initRootLogger() {
  //: only enable logging for debug mode
  Logger.root.level = kDebugMode ? Level.ALL : Level.OFF;
  developer.log('initalizing debug log');
  hierarchicalLoggingEnabled = true;

  Logger.root.onRecord.listen((record) {
    if (!kDebugMode) return;

    var start = '\x1b[90m';
    const end = '\x1b[0m';
    // ignore: unused_local_variable
    const white = '\x1b[37m';

    switch (record.level.name) {
      case 'INFO':
        start = '\x1b[37m';
        break;
      case 'WARNING':
        start = '\x1b[93m';
        break;
      case 'SEVERE':
        start = '\x1b[103m\x1b[31m';
        break;
      case 'SHOUT':
        start = '\x1b[41m\x1b[93m';
        break;
    }

    final message = '$start${record.level.name.padRight(10)} | ${record.message}$end';
    debugPrint(message);
    // developer.log(
    //   message,
    //   name: '${record.loggerName.padLeft(45)} ',
    //   level: record.level.value,
    //   time: record.time,
    // );
  });
}
