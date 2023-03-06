import '../models/search_result.dart';

abstract class GithubCache {
  SearchResult? get(String term);

  void set(String term, SearchResult result);

  bool contains(String term);

  void remove(String term);
}

class GithubCacheImpl extends GithubCache {
  final _cache = <String, SearchResult>{};

  @override
  SearchResult? get(String term) => _cache[term];

  @override
  void set(String term, SearchResult result) => _cache[term] = result;

  @override
  bool contains(String term) => _cache.containsKey(term);

  @override
  void remove(String term) => _cache.remove(term);
}
