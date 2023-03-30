import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/services/one_answer_quiz_api_service.dart';


abstract class OneAnswerQuizRepository {
  final OneAnswerQuizApiService oneAnswerQuizApiService;

  OneAnswerQuizRepository(this.oneAnswerQuizApiService);

  Future<List<OneAnswerQuiz>> fetchOneAnswerQuiz({int startIndex});
}

class OneAnswerQuizRepositoryImpl implements OneAnswerQuizRepository {

  @override
  final OneAnswerQuizApiServiceImpl oneAnswerQuizApiService;

  OneAnswerQuizRepositoryImpl({required this.oneAnswerQuizApiService});

  @override
  Future<List<OneAnswerQuiz>> fetchOneAnswerQuiz({int startIndex = 0}) async {
    return await oneAnswerQuizApiService.fetchOneAnswerQuiz(startIndex: startIndex);
  }
}
