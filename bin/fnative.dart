import 'dart:io';

import 'package:flutter_native/src/command_runner.dart';

Future<void> main(List<String> args) async {
  await _flushThenExit(await FlutterNativeCommandRunner().run(args));
}

Future<void> _flushThenExit(int status) {
  return Future.wait<void>([stdout.close(), stderr.close()])
      .then<void>((_) => exit(status));
}
