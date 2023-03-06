import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../utils/logger.dart';

class CredentialsLoader {
  final String pathToFile;

  CredentialsLoader({required this.pathToFile});

  Future<Credentials> load() async {
    return rootBundle.loadStructuredData<Credentials>(pathToFile, (jsonStr) async {
      final secret = Credentials.fromJson(json.decode(jsonStr));
      log.fine('secret $secret');
      return secret;
    });
  }
}

class Credentials {
  final String appName;
  final String apiDomain;

  Credentials({
    required this.appName,
    required this.apiDomain,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        appName: json['appName'],
        apiDomain: json['apiDomain'],
      );

  // applicationVersion is not included. Add it if needed
  Map<String, dynamic> toJson() => {
        'appName': appName,
        'apiDomain': apiDomain,
      };

  @override
  String toString() {
    return 'Credentials{appName: $appName, apiDomain: $apiDomain}';
  }
}
