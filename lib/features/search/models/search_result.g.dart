// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResult _$$_SearchResultFromJson(Map<String, dynamic> json) =>
    _$_SearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultToJson(_$_SearchResult instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
