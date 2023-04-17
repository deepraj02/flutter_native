import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class AndroidCommands extends Command<int> {
  AndroidCommands({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'cyan',
      abbr: 'c',
      help: 'Prints the same joke, but in cyan',
      negatable: false,
    );
  }

  @override
  String get description =>
      'Command to enable feature Modification for Android Platfrorm';

  @override
  String get name => 'android'; // fnative <sample>

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Which unicorn has a cold? The Achoo-nicorn!';
    if (argResults?['cyan'] == true) {
      output = lightCyan.wrap(output)!;
    }
    _logger.info(output);
    return ExitCode.success.code;
  }
}
