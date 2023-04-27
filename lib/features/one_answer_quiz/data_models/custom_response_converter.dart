
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/utils/app_utils.dart';
import 'answer.dart';

class AnswersListResponseConverter implements JsonConverter<List<Answer>, List<dynamic>> {
  const AnswersListResponseConverter();

  @override
  List<Answer> fromJson(List<dynamic> list) {
    return indexedMap(list, (index, e) {
      return Answer(id: index, answer: e);
    }).toList();
  }

  @override
  List<String> toJson(List<Answer> object) {
    return object.map((e) => e.answer!).toList();
  }
}
