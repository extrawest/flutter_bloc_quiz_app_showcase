import 'dart:async';

import '../models/search_result.dart';
import '../services/github_cache.dart';
import '../services/github_client.dart';

abstract class GithubRepository {
  Future<SearchResult> search(String term);
}

class GithubRepositoryImpl implements GithubRepository {
  final GithubCache _githubCache;
  final GithubClient _githubClient;

  const GithubRepositoryImpl(this._githubCache, this._githubClient);

  @override
  Future<SearchResult> search(String term) async {
    final cachedResult = _githubCache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await _githubClient.search(term);
    _githubCache.set(term, result);
    return result;
  }
}
