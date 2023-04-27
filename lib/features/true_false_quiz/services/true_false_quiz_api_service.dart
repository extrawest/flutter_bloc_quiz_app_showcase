import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';

import '../../../common/utils/logger.dart';
import '../../../network/api_client.dart';

const String trueFalseQuizPath = '/5d4b54e3-7172-43d0-b924-fe5d51707e8f';

abstract class TrueFalseQuizApiService {
  TrueFalseQuizApiService();

  Future<List<TrueFalseQuiz>> fetchTrueFalseQuiz({int startIndex = 0});
}

class TrueFalseQuizApiServiceImpl implements TrueFalseQuizApiService {
  final ApiClientImpl _apiClient;

  TrueFalseQuizApiServiceImpl(this._apiClient);

  @override
  Future<List<TrueFalseQuiz>> fetchTrueFalseQuiz({int startIndex = 0}) async {
    try {
      final trueFalseListResponse = await _apiClient.get(
        trueFalseQuizPath,
      );
      final oneAnswerQuizList =
      trueFalseListResponse.map((json) => TrueFalseQuiz.fromJson(json)).toList().cast<TrueFalseQuiz>();
      return oneAnswerQuizList;
    } catch (e) {
      log.severe('_fetchOneAnswerQuiz error: $e');
      rethrow;
    }
  }
}