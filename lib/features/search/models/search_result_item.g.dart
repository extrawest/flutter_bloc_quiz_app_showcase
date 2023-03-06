// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultItem _$$_SearchResultItemFromJson(Map<String, dynamic> json) =>
    _$_SearchResultItem(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchResultItemToJson(_$_SearchResultItem instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'html_url': instance.htmlUrl,
      'owner': instance.owner,
    };
