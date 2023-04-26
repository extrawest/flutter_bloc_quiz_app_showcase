import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<String?> getFlavor() async {
  if (kIsWeb) {
    return 'prod';
  }
  const channel = MethodChannel('flavor_channel');
  final flavor = await channel.invokeMethod<String>('getFlavor');
  return flavor;
}
