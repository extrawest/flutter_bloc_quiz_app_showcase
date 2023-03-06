import 'package:easy_localization/easy_localization.dart';
import 'package:logging/logging.dart';

import '../../main.dart';

final log = Logger('EW');

void setupLogger() {
  const isProd = bool.fromEnvironment(isProductionEnvKey, defaultValue: false);

  Logger.root.level = isProd ? Level.OFF : Level.ALL;
  Logger.root.onRecord.listen((record) {
    // It's used for printing in dev environment
    // ignore: avoid_print
    print('${record.level.name}, ${record.time}, '
        'Msg: ${record.message}, '
        '${record.error != null ? 'Error: ${record.error}, ' : ''}'
        '${record.stackTrace != null ? 'StackTrace: ${record.stackTrace}' : ''}');
  });

  if (isProd) {
    EasyLocalization.logger.enableBuildModes = [];
  }
}
