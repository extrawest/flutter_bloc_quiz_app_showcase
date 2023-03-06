import 'package:freezed_annotation/freezed_annotation.dart';

import 'github_user.dart';

part 'search_result_item.g.dart';
part 'search_result_item.freezed.dart';

@freezed
class SearchResultItem with _$SearchResultItem {
  const factory SearchResultItem({
    required String fullName,
    required String htmlUrl,
    required GithubUser owner,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}
