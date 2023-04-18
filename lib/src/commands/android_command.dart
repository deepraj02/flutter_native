import 'dart:io';

import 'package:args/command_runner.dart';

class AndroidCommands extends Command<int> {
  AndroidCommands() {
    argParser.addFlag(
      'enable-camera',
      help: 'Enables the Camera Permission',
      negatable: false,
    );
  }

  @override
  String get description =>
      'Command to enable feature Modification for Android Platfrorm';

  @override
  String get name => 'android'; // fnative <sample>

  Future<void> enableCameraPermission() async {
    // Locate the AndroidManifest.xml file
    const androidManifestPath = 'android/app/src/main/AndroidManifest.xml';
    final manifestFile = File(androidManifestPath);

    if (!manifestFile.existsSync()) {
      stdout.write('Error: AndroidManifest.xml not found.');
      return;
    }

    // Read the contents of the AndroidManifest.xml file
    final manifestContent = await manifestFile.readAsString();

    // Check if the camera permission is already added
    if (manifestContent.contains(
      '<uses-permission android:name="android.permission.CAMERA" />',
    )) {
      stdout.write('Camera permission is already added.');
      return;
    }

    // Add the camera permission
    final updatedManifestContent = manifestContent.replaceFirst(
      '<application',
      '<uses-permission android:name="android.permission.CAMERA" />\n<application',
    );
    await manifestFile.writeAsString(updatedManifestContent);

    stdout.write('Camera permission added successfully.');
  }
}
