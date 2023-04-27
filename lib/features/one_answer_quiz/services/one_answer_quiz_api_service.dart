import '../../../common/utils/logger.dart';
import '../../../network/api_client.dart';
import '../data_models/one_answer_quiz_data_model.dart';

const String oneAnswerQuizPath = '/0aeb7418-0c94-41ce-8f5b-09889cf37a58';

abstract class OneAnswerQuizApiService {
  OneAnswerQuizApiService();

  Future<List<OneAnswerQuiz>> fetchOneAnswerQuiz({int startIndex = 0});
}

class OneAnswerQuizApiServiceImpl implements OneAnswerQuizApiService {
  final ApiClientImpl _apiClient;

  OneAnswerQuizApiServiceImpl(this._apiClient);

  @override
  Future<List<OneAnswerQuiz>> fetchOneAnswerQuiz({int startIndex = 0}) async {
    try {
      final oneAnswerListResponse = await _apiClient.get(
        oneAnswerQuizPath,
      );
      final oneAnswerQuizList =
          oneAnswerListResponse.map((json) => OneAnswerQuiz.fromJson(json)).toList().cast<OneAnswerQuiz>();
      return oneAnswerQuizList;
    } catch (e) {
      log.severe('_fetchOneAnswerQuiz error: $e');
      rethrow;
    }
  }
}
