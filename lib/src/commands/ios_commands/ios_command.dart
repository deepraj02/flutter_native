import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class IOSCommands extends Command<int> {
  IOSCommands({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'green',
      abbr: 'c',
      help: 'Prints the same joke, but in green',
      negatable: false,
    );
  }

  @override
  String get description =>
      'Command to enable feature Modification for iOS Platfrorm';

  @override
  String get name => 'ios'; // fnative <sample>

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Which unicorn has a cold? The Achoo-nicorn!';
    if (argResults?['cyan'] == true) {
      output = green.wrap(output)!;
    }
    _logger.info(output);
    return ExitCode.success.code;
  }
}
