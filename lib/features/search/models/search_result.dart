import 'package:freezed_annotation/freezed_annotation.dart';

import 'search_result_item.dart';

part 'search_result.g.dart';
part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<SearchResultItem> items,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
