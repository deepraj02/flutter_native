import 'package:args/command_runner.dart';
import 'package:flutter_native/src/commands/android_commands/android_permission.dart';
import 'package:mason_logger/mason_logger.dart';

class AndroidCommands extends Command<int> {
  AndroidCommands() {
    addSubcommand(AndroidPermissions());
  }
  @override
  final name = 'android';
  @override
  final description =
      'Command to enable feature Modification for Android Platform';

  @override
  Future<int> run() async {
    final permissionCommand = AndroidPermissions();

    final permissionResult = await permissionCommand.run();
    if (permissionResult != ExitCode.success.code) {
      return permissionResult;
    }
    return ExitCode.success.code;
  }
}
