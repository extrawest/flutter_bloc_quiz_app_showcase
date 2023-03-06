import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user.g.dart';
part 'github_user.freezed.dart';

@freezed
class GithubUser with _$GithubUser {
  const factory GithubUser({
    required String login,
    required String avatarUrl,
  }) = _GithubUser;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
