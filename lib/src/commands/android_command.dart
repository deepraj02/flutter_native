import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class AndroidCommands extends Command<int> {
  AndroidCommands() {
    argParser
      ..addFlag(
        'enable-camera',
        help: 'Enables the Camera Permission',
        negatable: false,
      )
      ..addFlag(
        'enable-location',
        help: 'Enables the Android Location Permission',
        negatable: false,
      );
  }
  @override
  final name = 'android';
  @override
  final description =
      'Command to enable feature Modification for Android Platform';

  @override
  Future<int> run() async {
    final cameraEnabled = argResults!['enable-camera'] == true;
    final locationEnabled = argResults!['enable-location'] == true;

    if (cameraEnabled || locationEnabled) {
      // Locate the AndroidManifest.xml file
      const androidManifestPath = 'android/app/src/main/AndroidManifest.xml';
      final manifestFile = File(androidManifestPath);

      if (!manifestFile.existsSync()) {
        stdout.write(red.wrap('Error: AndroidManifest.xml not found.'));

        return 1;
      }

      // Read the contents of the AndroidManifest.xml file
      var manifestContent = await manifestFile.readAsString();

      if (cameraEnabled) {
        // Check if the camera permission is already added
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.CAMERA" />',
        )) {
          stdout.write(cyan.wrap('Camera permission is already added.\n'));
        } else {
          // Add the camera permission
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.CAMERA" />\n<application',
          );
          stdout.write(green.wrap('Camera permission added successfully.\n'));
        }
      }

      if (locationEnabled) {
        // Check if the location permission is already added
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />',
        )) {
          stdout.write(cyan.wrap('Location permission is already added.\n'));
        } else {
          // Add the location permission
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />\n<application',
          );
          stdout.write(green.wrap('Location permission added successfully.\n'));
        }
      }

      // Write the updated content to the AndroidManifest.xml file
      await manifestFile.writeAsString(manifestContent);
    }

    return 0;
  }
}
