<img src="https://user-images.githubusercontent.com/63138398/233612906-569a56e5-e7de-45c3-bd1d-52cf3e786b4d.png" alt="Button Preview" > 

  <h1 align="left">flutter_native</h1>
<!-- <p>
  <a href="https://github.com/deepraj02/flutter_native">
    <img src="https://user-images.githubusercontent.com/63138398/225706659-4fa396f3-fc8a-4cdc-bbd4-3600b323db97.svg" alt="Logo" >
  </a> -->
<p align="center">
<a href="https://github.com/deepraj02/flutter_native/issues">Request Feature</a>
<br>
<a href="https://github.com/deepraj02/flutter_native/issues">Report Bug</a>
</p>

![Contributors](https://img.shields.io/github/contributors/deepraj02/flutter_native?color=dark-green) ![Stargazers](https://img.shields.io/github/stars/deepraj02/flutter_native?style=social) ![Issues](https://img.shields.io/github/issues/deepraj02/flutter_native) ![License](https://img.shields.io/github/license/deepraj02/flutter_native) 

## Table Of Contents

- [](#)
      - [Examples:](#examples)
  - [Roadmap](#roadmap)
  - [Contributing](#contributing)
    - [Creating A Pull Request](#creating-a-pull-request)
  - [License](#license)
  - [Authors](#authors)

## About The Project

`flutter_native` is a command-line interface (CLI) tool that allows developers to modify and add app permissions to enable native features for both Android and iOS apps built with Flutter.


## Built With [Flutter](https://flutter.dev/) 💙

## Getting Started


### Prerequisites

To use the "flutter_native" cli, you will need to have the following installed:

Flutter & Dart SDK

If you do not have Flutter installed on your system, you can download it from the official Flutter website: https://flutter.dev/docs/get-started/install

### Installation💻

```sh
dart pub global activate flutter_native
```

Or locally via:

```sh
dart pub global activate --source=path <path to this package>
```

### Commands 🤯
The Package flutter_native can be accessed using the `fnative` executable

```bash
Flutter_native: The ultimate CLI tool for modifying app permissions and 
    enabling native features on Android and iOS 😉

Usage: fnative <command> [arguments]

Global options:
-h, --help            Print this usage information.
-v, --version         Print the current version.
    --[no-]verbose    Noisy logging, including all shell commands executed.

Available commands:
  android   Command to enable feature Modification for Android Platform
  update    Update the CLI.

Run "fnative help <command>" for more information about a command.
```

### Usage
Go Inside your Flutter Project Directory and  then run these commands to modify permissions for your `Android` app.

```dart

/// adds the camera permission to the Android App Manifest
fnative android permission --enable-camera

/// adds the location permission to the Android App Manifest
fnative android permission --enable-location

/// adds the call permission to the Android App Manifest
fnative android permission --enable-call

/// adds the storage permission to the Android App Manifest
fnative android permission --enable-storage

/// adds the bluetooth permission to the Android App Manifest
fnative android permission --enable-bluetooth

/// adds the all the permission mentioned above to the Android App Manifest at once
/// (in-beta)
fnative android permission --enable-all
```

### `fnative android permission  --help` 

```bash
fnative android permission --help
Permission Sub Command allows users to Enable Native Permissions

Usage: fnative android permission [arguments]
-h, --help                Print this usage information.
    --enable-camera       Enables the Camera Permission
    --enable-location     Enables the Android Location Permission
    --enable-call         Enables Call permission
    --enable-storage      Enables Storage permission
    --enable-bluetooth    Enables bluetooth permission
    --enable-all          Enables the Camera Permission

Run "fnative help" to see global options.
```
## Roadmap

See the [open issues](https://github.com/deepraj02/flutter_native/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.
* If you have suggestions for adding or removing projects, feel free to [open an issue](https://github.com/deepraj02/flutter_native/issues/new) to discuss it, or directly create a pull request after you edit the *README.md* file with necessary changes.
* Please make sure you check your spelling and grammar.
* Create individual PR for each suggestion.

## Limitations and Future Plans 🚀


### Limitations:
`flutter_native` for now can only modify/add the permissions in Android app Manifest file.
iOS platform and other functionalitis in Android will be available in the future versions.  
### Future plans:

-  Add support for modifying iOS app permissions using the CLI.
-  Add support for adding signing keys for Android and iOS apps using the CLI.

-  Enhance CLI interface for better user experience.
-  Add support for modifying other Android and iOS configurations, such as adding entitlements for iOS apps and modifying Android manifest files.

-  Add support for modifying build settings for both Android and iOS apps using the CLI.
-  Improve documentation for the package and provide more examples and tutorials.

-  Add support for modifying app icons for both Android and iOS apps using the CLI.
-  Add support for modifying app names and descriptions for both Android and iOS apps using the CLI.



### Creating A Pull Request

- Fork the Project
- Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
- Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
- Push to the Branch (`git push origin feature/AmazingFeature`)
- Open a Pull Request (`choose the Staging branch From the Dropdown`)

## Authors

* **Deepraj Baidya** - *Flutter SDE Intern* - [Deepraj Baidya](https://github.com/deepraj02) - *🤔 *

---