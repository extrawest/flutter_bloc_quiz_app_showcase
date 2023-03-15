import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/one_answer_quiz_repository.dart';

part 'one_answer_event.dart';
part 'one_answer_state.dart';

class OneAnswerBloc extends Bloc<OneAnswerEvent, OneAnswerState> {
  final OneAnswerQuizRepositoryImpl oneAnswerQuizRepository;

  OneAnswerBloc({required this.oneAnswerQuizRepository}) : super(OneAnswerInitial()) {
    on<OneAnswerFetchEvent>(_onQuizQuestionFetched);
  }

  Future<void> _onQuizQuestionFetched(OneAnswerFetchEvent event, Emitter<OneAnswerState> emit) async {
    try {
      if (state.status == OneAnswerStatus.initial) {
        final questions = await oneAnswerQuizRepository.fetchOneAnswerQuiz();
        return emit(
          state.copyWith(status: OneAnswerStatus.success, quizQuestions: questions),
        );
      }
      final questions = await oneAnswerQuizRepository.fetchOneAnswerQuiz();
      emit(
        state.copyWith(
          status: OneAnswerStatus.success,
          quizQuestions: List.of(state.quizQuestions)..addAll(questions),
          hasReachedMax: false,
        ),
      );
    } catch (e, _) {
      /// use exception and [stackTrace] in Firebase Crashlytics or Sentry (for Web)
      emit(
        state.copyWith(
          status: OneAnswerStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
