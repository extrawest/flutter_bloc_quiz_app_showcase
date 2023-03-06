import 'package:flutter/services.dart';

Future<String?> getFlavor() async {
  const channel = MethodChannel('flavor_channel');
  final flavor = await channel.invokeMethod<String>('getFlavor');
  return flavor;
}
