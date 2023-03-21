import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';

import '../../true_false_quiz/services/true_false_quiz_api_service.dart';

abstract class TrueFalseQuizRepository {
  final TrueFalseQuizApiService trueFalseQuizApiService;

  TrueFalseQuizRepository(this.trueFalseQuizApiService);

  Future<List<TrueFalseQuiz>> fetchOneAnswerQuiz({int startIndex});
}

class TrueFalseQuizRepositoryImpl implements TrueFalseQuizRepository {

  @override
  final TrueFalseQuizApiServiceImpl trueFalseQuizApiService;

  TrueFalseQuizRepositoryImpl({required this.trueFalseQuizApiService});

  @override
  Future<List<TrueFalseQuiz>> fetchOneAnswerQuiz({int startIndex = 0}) async {
    return await trueFalseQuizApiService.fetchTrueFalseQuiz(startIndex: startIndex);
  }
}