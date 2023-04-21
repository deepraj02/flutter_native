import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class AndroidPermissions extends Command<int> {
  AndroidPermissions() {
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
      )
      ..addFlag(
        'enable-call',
        help: 'Enables Call permission',
        negatable: false,
      )
      ..addFlag(
        'enable-storage',
        help: 'Enables Storage permission',
        negatable: false,
      )
      ..addFlag(
        'enable-bluetooth',
        help: 'Enables bluetooth permission',
        negatable: false,
      )
      ..addFlag(
        'enable-all',
        help: 'Enables the Camera Permission',
        negatable: false,
      );
  }
  @override
  final name = 'permission';
  @override
  final description =
      'Permission Sub Command allows users to Enable Native Permissions';

  @override
  Future<int> run() async {
    final cameraEnabled = argResults!['enable-camera'] == true;
    final locationEnabled = argResults!['enable-location'] == true;
    final callEnabled = argResults!['enable-call'] == true;
    final bluetoothEnabled = argResults!['enable-bluetooth'] == true;
    final storageEnabled = argResults!['enable-storage'] == true;
    final allEnabled = argResults!['enable-all'] == true;

    if (cameraEnabled ||
        locationEnabled ||
        callEnabled ||
        bluetoothEnabled ||
        storageEnabled ||
        allEnabled) {
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
      if (callEnabled) {
        // Check if the camera permission is already added
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.CALL_PHONE" />',
        )) {
          stdout.write(cyan.wrap('Call permission is already added.\n'));
        } else {
          // Add the camera permission
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.CALL_PHONE" />\n<application',
          );
          stdout.write(green.wrap('Call permission added successfully.\n'));
        }
      }
      if (bluetoothEnabled) {
        // Check if the camera permission is already added
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.BLUETOOTH" />',
        )) {
          stdout.write(cyan.wrap('Call permission is already added.\n'));
        } else {
          // Add the camera permission
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.BLUETOOTH" />\n<application',
          );
          stdout.write(green.wrap('Call permission added successfully.\n'));
        }
      }

      if (locationEnabled) {
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />',
        )) {
          stdout.write(cyan.wrap('Location permission is already added.\n'));
        } else {
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />\n<application',
          );
          stdout.write(green.wrap('Location permission added successfully.\n'));
        }
      }
      if (storageEnabled) {
        if (manifestContent.contains(
              '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />',
            )) {
          stdout.write(
            cyan.wrap(
              'Storage permissions (READ AND WRITE) is already added.\n',
            ),
          );
        } else {
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />\n\n<application',
          );
          stdout.write(green.wrap('STORAGE permissions added successfully.\n'));
        }
      }
      if (locationEnabled) {
        if (manifestContent.contains(
          '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />',
        )) {
          stdout.write(cyan.wrap('Location permission is already added.\n'));
        } else {
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />\n<application',
          );
          stdout.write(green.wrap('Location permission added successfully.\n'));
        }
      }
      if (allEnabled) {
        // Check if the permissions are already added
        if (manifestContent.contains(
              '<uses-permission android:name="android.permission.CAMERA" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.CALL_PHONE" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.BLUETOOTH" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />',
            ) &&
            manifestContent.contains(
              '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />',
            )) {
          stdout.write(cyan.wrap('All permissions are already added.\n'));
        } else {
          // Add the permissions
          manifestContent = manifestContent.replaceFirst(
            '<application',
            '<uses-permission android:name="android.permission.CAMERA" />\n<uses-permission android:name="android.permission.CALL_PHONE" />\n<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />\n<uses-permission android:name="android.permission.BLUETOOTH" />\n<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />\n <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />\n<application',
          );
          stdout.write(green.wrap('All permissions added successfully.\n'));
        }
      }
      await manifestFile.writeAsString(manifestContent);
    }

    return 0;
  }
}
