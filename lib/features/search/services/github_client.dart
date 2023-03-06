import 'dart:async';

import 'package:bloc_quiz_training/common/utils/logger.dart';
import 'package:bloc_quiz_training/network/api_client.dart';

import '../models/search_result.dart';

//'https://api.github.com/search/repositories?q='
const String searchPath = '/search/repositories';

abstract class GithubClient {
  Future<SearchResult> search(String term);
}

class GithubClientImpl implements GithubClient {
  final ApiClient _apiClient;

  GithubClientImpl(this._apiClient);

  @override
  Future<SearchResult> search(String term) async {
    try {
      final response = await _apiClient.get(searchPath, params: {'q': term});
      return SearchResult.fromJson(response);
    } catch (e) {
      log.severe('search error: $e, term: $term');
      rethrow;
    }
  }
}
